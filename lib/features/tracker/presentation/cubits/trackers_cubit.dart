import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/coordinate_utils.dart';
import '../../data/models/tracker_model.dart';
import '../../data/models/tracker_state_model.dart';
import '../../domain/repositories/tracker_repository.dart';
import 'trackers_state.dart';

class TrackersCubit extends Cubit<TrackersState> {
  TrackersCubit(this._repository) : super(const TrackersState());

  final TrackerRepository _repository;
  final Set<int> _hiddenIds = <int>{};

  Future<void> loadTrackers() async {
    final hadData = state.trackers.isNotEmpty;
    emit(
      state.copyWith(
        status: hadData ? TrackersStatus.success : TrackersStatus.loading,
        clearError: !hadData,
        isStale: hadData,
      ),
    );

    try {
      final trackers = await _repository.fetchTrackers();
      final ids = trackers
          .map((tracker) => tracker.id)
          .whereType<int>()
          .toSet();
      final visible = _visibleIdsFor(ids);
      final selected = ids.contains(state.selectedTrackerId)
          ? state.selectedTrackerId
          : null;
      final next = state.copyWith(
        status: trackers.isEmpty
            ? TrackersStatus.empty
            : TrackersStatus.success,
        trackers: trackers,
        selectedTrackerId: selected,
        clearSelection: selected == null,
        visibleTrackerIds: visible,
        clearError: true,
        isStale: false,
      );
      emit(next.copyWith(filteredTrackers: _applyFilters(next)));
    } catch (error) {
      emit(
        state.copyWith(
          status: hadData ? TrackersStatus.success : TrackersStatus.error,
          errorMessage: failureFrom(error).message,
          isStale: hadData,
          filteredTrackers: hadData ? state.filteredTrackers : const [],
        ),
      );
    }
  }

  void search(String query) {
    final next = state.copyWith(searchQuery: query);
    emit(next.copyWith(filteredTrackers: _applyFilters(next)));
  }

  void setFilter(TrackerFilter filter) {
    final next = state.copyWith(filter: filter);
    emit(next.copyWith(filteredTrackers: _applyFilters(next)));
  }

  void selectTracker(int id) {
    if (!state.trackers.any((tracker) => tracker.id == id)) {
      return;
    }
    if (state.selectedTrackerId == id) {
      return;
    }
    emit(state.copyWith(selectedTrackerId: id));
  }

  void clearSelection() {
    if (state.selectedTrackerId == null) {
      return;
    }
    emit(state.copyWith(clearSelection: true));
  }

  void toggleVisibility(int id) {
    if (_hiddenIds.contains(id)) {
      _hiddenIds.remove(id);
    } else {
      _hiddenIds.add(id);
    }
    final visible = _visibleIdsFor(
      state.trackers.map((tracker) => tracker.id).whereType<int>(),
    );
    emit(state.copyWith(visibleTrackerIds: visible));
  }

  void showAllOnMap() {
    _hiddenIds.clear();
    final visible = _visibleIdsFor(
      state.trackers.map((tracker) => tracker.id).whereType<int>(),
    );
    emit(state.copyWith(visibleTrackerIds: visible));
  }

  /// Checks or unchecks every tracker in the current list. The map follows
  /// [TrackersState.mapTrackerIds], so hidden trackers disappear from it.
  void setListedVisible(bool visible) {
    final ids = state.filteredTrackers
        .map((tracker) => tracker.id)
        .whereType<int>();
    if (visible) {
      _hiddenIds.removeAll(ids);
    } else {
      _hiddenIds.addAll(ids);
    }
    emit(
      state.copyWith(
        visibleTrackerIds: _visibleIdsFor(
          state.trackers.map((tracker) => tracker.id).whereType<int>(),
        ),
      ),
    );
  }

  /// Copies connection and movement status from live GPS data so filters can
  /// run inside this cubit. Coordinates stay owned by [LiveTrackingCubit].
  void syncLiveStates(Map<int, TrackerGpsState?> states) {
    final snapshots = <int, TrackerLiveStatus>{};
    states.forEach((id, gpsState) {
      if (gpsState == null) {
        return;
      }
      final location = gpsState.gps?.location;
      snapshots[id] = TrackerLiveStatus(
        connectionStatus: gpsState.connectionStatus,
        movementStatus: gpsState.movementStatus,
        speed: gpsState.gps?.speed,
        hasGps: isValidCoordinate(location?.lat, location?.lng),
      );
    });
    final next = state.copyWith(statusById: snapshots);
    emit(next.copyWith(filteredTrackers: _applyFilters(next)));
  }

  Set<int> _visibleIdsFor(Iterable<int> ids) {
    final existing = ids.toSet();
    _hiddenIds.removeWhere((id) => !existing.contains(id));
    return existing.difference(_hiddenIds);
  }

  List<Tracker> _applyFilters(TrackersState source) {
    final query = source.searchQuery.trim().toLowerCase();
    return source.trackers.where((tracker) {
      final id = tracker.id;
      if (id == null) {
        return false;
      }
      if (query.isNotEmpty) {
        final label = tracker.label.toLowerCase();
        final matches = label.contains(query) || id.toString().contains(query);
        if (!matches) {
          return false;
        }
      }

      final live = source.statusById[id];
      switch (source.filter) {
        case TrackerFilter.all:
          return true;
        case TrackerFilter.online:
          return live?.isOnline ?? false;
        case TrackerFilter.offline:
          return live != null && !live.isOnline;
        case TrackerFilter.moving:
          return live?.isMoving ?? false;
        case TrackerFilter.parked:
          return live?.isParked ?? false;
        case TrackerFilter.blocked:
          return tracker.source?.blocked == true;
      }
    }).toList();
  }
}

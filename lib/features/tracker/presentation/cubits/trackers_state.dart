import 'package:equatable/equatable.dart';

import '../../data/models/tracker_model.dart';

enum TrackersStatus { initial, loading, success, empty, error }

enum TrackerFilter { all, online, offline, moving, parked, blocked }

class TrackerLiveStatus extends Equatable {
  const TrackerLiveStatus({
    this.connectionStatus,
    this.movementStatus,
    this.speed,
    this.hasGps = false,
  });

  final String? connectionStatus;
  final String? movementStatus;
  final double? speed;
  final bool hasGps;

  bool get isOnline => connectionStatus?.toLowerCase() == 'active';

  bool get isMoving => movementStatus?.toLowerCase() == 'moving';

  bool get isParked => movementStatus?.toLowerCase() == 'parked';

  @override
  List<Object?> get props => [connectionStatus, movementStatus, speed, hasGps];
}

class TrackersState extends Equatable {
  const TrackersState({
    this.status = TrackersStatus.initial,
    this.trackers = const <Tracker>[],
    this.filteredTrackers = const <Tracker>[],
    this.searchQuery = '',
    this.filter = TrackerFilter.all,
    this.selectedTrackerId,
    this.visibleTrackerIds = const <int>{},
    this.statusById = const <int, TrackerLiveStatus>{},
    this.errorMessage,
    this.isStale = false,
  });

  final TrackersStatus status;
  final List<Tracker> trackers;
  final List<Tracker> filteredTrackers;
  final String searchQuery;
  final TrackerFilter filter;
  final int? selectedTrackerId;
  final Set<int> visibleTrackerIds;
  final Map<int, TrackerLiveStatus> statusById;
  final String? errorMessage;
  final bool isStale;

  /// Trackers that pass the current filter and are still checked for the map.
  Set<int> get mapTrackerIds {
    return {
      for (final tracker in filteredTrackers)
        if (tracker.id != null && visibleTrackerIds.contains(tracker.id))
          tracker.id!,
    };
  }

  Tracker? get selectedTracker {
    for (final tracker in trackers) {
      if (tracker.id == selectedTrackerId) {
        return tracker;
      }
    }
    return null;
  }

  TrackersState copyWith({
    TrackersStatus? status,
    List<Tracker>? trackers,
    List<Tracker>? filteredTrackers,
    String? searchQuery,
    TrackerFilter? filter,
    int? selectedTrackerId,
    bool clearSelection = false,
    Set<int>? visibleTrackerIds,
    Map<int, TrackerLiveStatus>? statusById,
    String? errorMessage,
    bool clearError = false,
    bool? isStale,
  }) {
    return TrackersState(
      status: status ?? this.status,
      trackers: trackers ?? this.trackers,
      filteredTrackers: filteredTrackers ?? this.filteredTrackers,
      searchQuery: searchQuery ?? this.searchQuery,
      filter: filter ?? this.filter,
      selectedTrackerId: clearSelection
          ? null
          : selectedTrackerId ?? this.selectedTrackerId,
      visibleTrackerIds: visibleTrackerIds ?? this.visibleTrackerIds,
      statusById: statusById ?? this.statusById,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      isStale: isStale ?? this.isStale,
    );
  }

  @override
  List<Object?> get props => [
    status,
    trackers,
    filteredTrackers,
    searchQuery,
    filter,
    selectedTrackerId,
    visibleTrackerIds,
    statusById,
    errorMessage,
    isStale,
  ];
}

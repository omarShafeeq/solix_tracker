import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/tracker_repository.dart';
import 'tracker_details_state.dart';

class TrackerDetailsCubit extends Cubit<TrackerDetailsState> {
  TrackerDetailsCubit(this._repository) : super(const TrackerDetailsState());

  final TrackerRepository _repository;
  int? _inFlightId;

  Future<void> loadDetails(int trackerId, {bool force = false}) async {
    final alreadyLoaded =
        state.tracker?.id == trackerId &&
        state.status == TrackerDetailsStatus.loaded &&
        !state.isStale;
    if (!force && alreadyLoaded) {
      return;
    }
    if (_inFlightId == trackerId) {
      return;
    }

    final keepCurrent = state.tracker?.id == trackerId;
    _inFlightId = trackerId;
    emit(
      state.copyWith(
        status: TrackerDetailsStatus.loading,
        clearTracker: !keepCurrent,
        clearError: true,
        isStale: keepCurrent,
      ),
    );

    try {
      final tracker = await _repository.fetchTrackerById(trackerId);
      if (isClosed || _inFlightId != trackerId) {
        return;
      }
      emit(
        TrackerDetailsState(
          status: TrackerDetailsStatus.loaded,
          tracker: tracker,
        ),
      );
    } catch (error) {
      if (isClosed || _inFlightId != trackerId) {
        return;
      }
      final sameTracker =
          state.tracker?.id == trackerId && state.tracker != null;
      emit(
        state.copyWith(
          status: sameTracker
              ? TrackerDetailsStatus.loaded
              : TrackerDetailsStatus.error,
          errorMessage: failureFrom(error).message,
          isStale: sameTracker,
          clearTracker: !sameTracker,
        ),
      );
    } finally {
      if (_inFlightId == trackerId) {
        _inFlightId = null;
      }
    }
  }

  void clear() {
    _inFlightId = null;
    emit(const TrackerDetailsState());
  }
}

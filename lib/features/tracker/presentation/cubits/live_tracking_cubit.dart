import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/tracker_state_model.dart';
import '../../domain/repositories/tracker_repository.dart';
import 'live_tracking_state.dart';

class LiveTrackingCubit extends Cubit<LiveTrackingState> {
  LiveTrackingCubit(
    this._repository, {
    Duration refreshInterval = const Duration(seconds: 10),
    int batchSize = 100,
  }) : _batchSize = batchSize < 1 ? 1 : batchSize,
       super(LiveTrackingState(refreshInterval: refreshInterval));

  final TrackerRepository _repository;
  final int _batchSize;

  Timer? _timer;
  List<int> _trackerIds = const <int>[];
  bool _inFlight = false;
  bool _refreshQueued = false;

  void startTracking(List<int> trackerIds) {
    updateTrackerIds(trackerIds);
    if (!state.statsEnabled) {
      _timer?.cancel();
      _timer = null;
      emit(state.copyWith(isTracking: false));
      return;
    }
    _restartTimer();
    emit(state.copyWith(isTracking: true));
    unawaited(refreshStates());
  }

  /// Turns periodic state requests on or off. The default is on.
  void setStatsEnabled(bool enabled) {
    if (state.statsEnabled == enabled) {
      return;
    }
    emit(state.copyWith(statsEnabled: enabled));
    if (!enabled) {
      stopTracking();
      return;
    }
    if (_trackerIds.isEmpty) {
      return;
    }
    startTracking(_trackerIds);
  }

  void stopTracking() {
    _timer?.cancel();
    _timer = null;
    emit(state.copyWith(isTracking: false, isRefreshing: false));
  }

  void updateTrackerIds(List<int> trackerIds) {
    _trackerIds = List<int>.unmodifiable(trackerIds);
    final allowed = _trackerIds.toSet();
    if (state.states.keys.any((id) => !allowed.contains(id))) {
      final next = Map<int, TrackerGpsState?>.from(state.states)
        ..removeWhere((id, _) => !allowed.contains(id));
      emit(state.copyWith(states: next));
    }
  }

  void updateRefreshInterval(Duration interval) {
    final seconds = interval.inSeconds;
    if (seconds < AppConstants.minRefreshIntervalSeconds) {
      return;
    }
    emit(state.copyWith(refreshInterval: Duration(seconds: seconds)));
    if (_timer != null) {
      _restartTimer();
    }
  }

  Future<void> refreshStates() async {
    if (isClosed || _trackerIds.isEmpty) {
      return;
    }
    if (_inFlight) {
      _refreshQueued = true;
      return;
    }
    _inFlight = true;
    emit(state.copyWith(isRefreshing: true));

    final merged = Map<int, TrackerGpsState?>.from(state.states);
    var userTime = state.userTime;
    var failed = false;
    String? errorMessage;

    try {
      for (final batch in _chunks(_trackerIds, _batchSize)) {
        if (isClosed) {
          return;
        }
        try {
          final result = await _repository.fetchStates(batch);
          if (!result.success) {
            throw const InvalidResponseException('تعذر تحميل حالات المتتبعات.');
          }
          userTime = result.userTime ?? userTime;
          merged.addAll(result.states);
          if (!isClosed) {
            emit(
              state.copyWith(
                states: Map<int, TrackerGpsState?>.from(merged),
                userTime: userTime,
                isRefreshing: true,
                clearError: true,
                isStale: false,
              ),
            );
          }
        } catch (error) {
          failed = true;
          errorMessage = failureFrom(error).message;
          break;
        }
      }

      if (isClosed) {
        return;
      }
      if (failed) {
        emit(
          state.copyWith(
            states: merged,
            userTime: userTime,
            isRefreshing: false,
            errorMessage: errorMessage,
            isStale: merged.isNotEmpty || state.lastSync != null,
          ),
        );
      } else {
        emit(
          state.copyWith(
            states: merged,
            userTime: userTime,
            isRefreshing: false,
            isStale: false,
            lastSync: DateTime.now(),
            clearError: true,
          ),
        );
      }
    } finally {
      _inFlight = false;
      if (_refreshQueued && !isClosed && state.statsEnabled) {
        _refreshQueued = false;
        unawaited(refreshStates());
      }
    }
  }

  void _restartTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(state.refreshInterval, (_) {
      unawaited(refreshStates());
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    _timer = null;
    return super.close();
  }
}

List<List<int>> _chunks(List<int> ids, int size) {
  final batches = <List<int>>[];
  for (var index = 0; index < ids.length; index += size) {
    final end = index + size > ids.length ? ids.length : index + size;
    batches.add(ids.sublist(index, end));
  }
  return batches;
}

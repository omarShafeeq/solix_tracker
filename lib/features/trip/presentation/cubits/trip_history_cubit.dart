import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/format_utils.dart';
import '../../domain/repositories/trip_repository.dart';
import 'trip_history_state.dart';

class TripHistoryCubit extends Cubit<TripHistoryState> {
  TripHistoryCubit(this._repository) : super(const TripHistoryState());

  final TripRepository _repository;
  Timer? _playbackTimer;
  int _requestToken = 0;

  void setTracker(int? trackerId) {
    if (state.trackerId == trackerId) {
      return;
    }
    _stopPlayback(resetIndex: true);
    emit(
      state.copyWith(
        trackerId: trackerId,
        clearTracker: trackerId == null,
        trips: const [],
        clearSelectedTrip: true,
        status: TripHistoryStatus.initial,
        clearError: true,
        playbackIndex: 0,
        playbackStatus: PlaybackStatus.idle,
      ),
    );
  }

  void setDateRange({required DateTime from, required DateTime to}) {
    _stopPlayback(resetIndex: true);
    emit(
      state.copyWith(
        from: from,
        to: to,
        playbackIndex: 0,
        playbackStatus: PlaybackStatus.idle,
      ),
    );
  }

  Future<void> loadTrips() async {
    final trackerId = state.trackerId;
    final from = state.from;
    final to = state.to;
    if (trackerId == null) {
      emit(
        state.copyWith(
          status: TripHistoryStatus.error,
          errorMessage: 'اختر متتبعاً قبل تحميل الرحلات.',
          trips: const [],
          clearSelectedTrip: true,
        ),
      );
      return;
    }
    if (from == null || to == null) {
      emit(
        state.copyWith(
          status: TripHistoryStatus.error,
          errorMessage: 'اختر تاريخ البداية وتاريخ النهاية.',
        ),
      );
      return;
    }
    if (!to.isAfter(from)) {
      emit(
        state.copyWith(
          status: TripHistoryStatus.error,
          errorMessage: 'يجب أن يكون تاريخ النهاية بعد تاريخ البداية.',
        ),
      );
      return;
    }

    final token = ++_requestToken;
    _stopPlayback(resetIndex: true);
    emit(
      state.copyWith(
        status: TripHistoryStatus.loading,
        clearError: true,
        playbackIndex: 0,
        playbackStatus: PlaybackStatus.idle,
      ),
    );

    try {
      final trips = await _repository.fetchTrips(
        trackerId: trackerId,
        from: formatRequestDate(from),
        to: formatRequestDate(to),
      );
      if (isClosed || token != _requestToken) {
        return;
      }
      emit(
        state.copyWith(
          status: trips.isEmpty
              ? TripHistoryStatus.empty
              : TripHistoryStatus.success,
          trips: trips,
          selectedTripIndex: trips.isEmpty ? null : 0,
          clearSelectedTrip: trips.isEmpty,
          clearError: true,
        ),
      );
    } catch (error) {
      if (isClosed || token != _requestToken) {
        return;
      }
      emit(
        state.copyWith(
          status: TripHistoryStatus.error,
          errorMessage: failureFrom(error).message,
          trips: state.trips,
        ),
      );
    }
  }

  void selectTrip(int index) {
    if (index < 0 || index >= state.trips.length) {
      return;
    }
    if (state.selectedTripIndex == index) {
      return;
    }
    _stopPlayback(resetIndex: true);
    emit(
      state.copyWith(
        selectedTripIndex: index,
        playbackIndex: 0,
        playbackStatus: PlaybackStatus.idle,
      ),
    );
  }

  void play() {
    final points = state.selectedPoints;
    if (points.length < 2) {
      return;
    }
    if (state.playbackIndex >= points.length - 1) {
      emit(state.copyWith(playbackIndex: 0));
    }
    emit(state.copyWith(playbackStatus: PlaybackStatus.playing));
    _scheduleTick();
  }

  void pause() {
    _playbackTimer?.cancel();
    _playbackTimer = null;
    if (state.playbackStatus == PlaybackStatus.playing) {
      emit(state.copyWith(playbackStatus: PlaybackStatus.paused));
    }
  }

  void stopPlayback() {
    _stopPlayback(resetIndex: true);
    emit(state.copyWith(playbackStatus: PlaybackStatus.idle, playbackIndex: 0));
  }

  void setPlaybackSpeed(double speed) {
    const allowed = <double>[1, 2, 5, 10];
    if (!allowed.contains(speed)) {
      return;
    }
    emit(state.copyWith(playbackSpeed: speed));
    if (state.playbackStatus == PlaybackStatus.playing) {
      _scheduleTick();
    }
  }

  void _scheduleTick() {
    _playbackTimer?.cancel();
    final milliseconds = (400 / state.playbackSpeed).round().clamp(40, 2000);
    _playbackTimer = Timer(Duration(milliseconds: milliseconds), () {
      if (isClosed || state.playbackStatus != PlaybackStatus.playing) {
        return;
      }
      final last = state.selectedPoints.length - 1;
      if (last < 1) {
        stopPlayback();
        return;
      }
      final next = state.playbackIndex + 1;
      if (next >= last) {
        emit(
          state.copyWith(
            playbackIndex: last,
            playbackStatus: PlaybackStatus.idle,
          ),
        );
        _playbackTimer = null;
        return;
      }
      emit(state.copyWith(playbackIndex: next));
      _scheduleTick();
    });
  }

  void _stopPlayback({required bool resetIndex}) {
    _playbackTimer?.cancel();
    _playbackTimer = null;
    if (resetIndex && state.playbackIndex != 0) {
      // The caller emits the index reset so playback changes stay in one state.
    }
  }

  @override
  Future<void> close() {
    _playbackTimer?.cancel();
    return super.close();
  }
}

import 'package:equatable/equatable.dart';

import '../../data/models/trip_model.dart';

enum TripHistoryStatus { initial, loading, success, empty, error }

enum PlaybackStatus { idle, playing, paused }

class TripHistoryState extends Equatable {
  const TripHistoryState({
    this.status = TripHistoryStatus.initial,
    this.trackerId,
    this.from,
    this.to,
    this.trips = const <Trip>[],
    this.selectedTripIndex,
    this.errorMessage,
    this.playbackStatus = PlaybackStatus.idle,
    this.playbackIndex = 0,
    this.playbackSpeed = 1,
  });

  final TripHistoryStatus status;
  final int? trackerId;
  final DateTime? from;
  final DateTime? to;
  final List<Trip> trips;
  final int? selectedTripIndex;
  final String? errorMessage;
  final PlaybackStatus playbackStatus;
  final int playbackIndex;
  final double playbackSpeed;

  Trip? get selectedTrip {
    final index = selectedTripIndex;
    if (index == null || index < 0 || index >= trips.length) {
      return null;
    }
    return trips[index];
  }

  List<TripPoint> get selectedPoints => selectedTrip?.pointsList ?? const [];

  TripHistoryState copyWith({
    TripHistoryStatus? status,
    int? trackerId,
    bool clearTracker = false,
    DateTime? from,
    DateTime? to,
    List<Trip>? trips,
    int? selectedTripIndex,
    bool clearSelectedTrip = false,
    String? errorMessage,
    bool clearError = false,
    PlaybackStatus? playbackStatus,
    int? playbackIndex,
    double? playbackSpeed,
  }) {
    return TripHistoryState(
      status: status ?? this.status,
      trackerId: clearTracker ? null : trackerId ?? this.trackerId,
      from: from ?? this.from,
      to: to ?? this.to,
      trips: trips ?? this.trips,
      selectedTripIndex: clearSelectedTrip
          ? null
          : selectedTripIndex ?? this.selectedTripIndex,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      playbackStatus: playbackStatus ?? this.playbackStatus,
      playbackIndex: playbackIndex ?? this.playbackIndex,
      playbackSpeed: playbackSpeed ?? this.playbackSpeed,
    );
  }

  @override
  List<Object?> get props => [
    status,
    trackerId,
    from,
    to,
    trips,
    selectedTripIndex,
    errorMessage,
    playbackStatus,
    playbackIndex,
    playbackSpeed,
  ];
}

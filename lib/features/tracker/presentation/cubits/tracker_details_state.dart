import 'package:equatable/equatable.dart';

import '../../data/models/tracker_model.dart';

enum TrackerDetailsStatus { initial, loading, loaded, error }

class TrackerDetailsState extends Equatable {
  const TrackerDetailsState({
    this.status = TrackerDetailsStatus.initial,
    this.tracker,
    this.errorMessage,
    this.isStale = false,
  });

  final TrackerDetailsStatus status;
  final Tracker? tracker;
  final String? errorMessage;
  final bool isStale;

  TrackerDetailsState copyWith({
    TrackerDetailsStatus? status,
    Tracker? tracker,
    bool clearTracker = false,
    String? errorMessage,
    bool clearError = false,
    bool? isStale,
  }) {
    return TrackerDetailsState(
      status: status ?? this.status,
      tracker: clearTracker ? null : tracker ?? this.tracker,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      isStale: isStale ?? this.isStale,
    );
  }

  @override
  List<Object?> get props => [status, tracker, errorMessage, isStale];
}

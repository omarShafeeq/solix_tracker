import 'package:equatable/equatable.dart';

import '../../data/models/tracker_state_model.dart';

class LiveTrackingState extends Equatable {
  const LiveTrackingState({
    this.states = const <int, TrackerGpsState?>{},
    this.isRefreshing = false,
    this.isTracking = false,
    this.statsEnabled = true,
    this.isStale = false,
    this.refreshInterval = const Duration(seconds: 10),
    this.lastSync,
    this.userTime,
    this.errorMessage,
  });

  final Map<int, TrackerGpsState?> states;
  final bool isRefreshing;
  final bool isTracking;

  /// When false, periodic tracker-state requests stay stopped.
  final bool statsEnabled;
  final bool isStale;
  final Duration refreshInterval;
  final DateTime? lastSync;
  final String? userTime;
  final String? errorMessage;

  TrackerGpsState? stateFor(int? trackerId) {
    if (trackerId == null) {
      return null;
    }
    return states[trackerId];
  }

  LiveTrackingState copyWith({
    Map<int, TrackerGpsState?>? states,
    bool? isRefreshing,
    bool? isTracking,
    bool? statsEnabled,
    bool? isStale,
    Duration? refreshInterval,
    DateTime? lastSync,
    String? userTime,
    String? errorMessage,
    bool clearError = false,
  }) {
    return LiveTrackingState(
      states: states ?? this.states,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      isTracking: isTracking ?? this.isTracking,
      statsEnabled: statsEnabled ?? this.statsEnabled,
      isStale: isStale ?? this.isStale,
      refreshInterval: refreshInterval ?? this.refreshInterval,
      lastSync: lastSync ?? this.lastSync,
      userTime: userTime ?? this.userTime,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    states,
    isRefreshing,
    isTracking,
    statsEnabled,
    isStale,
    refreshInterval,
    lastSync,
    userTime,
    errorMessage,
  ];
}

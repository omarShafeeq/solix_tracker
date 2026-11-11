import '../../data/models/tracker_model.dart';
import '../../data/models/tracker_state_model.dart';

class TrackerStatesResult {
  const TrackerStatesResult({
    required this.states,
    required this.success,
    this.userTime,
  });

  final Map<int, TrackerGpsState?> states;
  final bool success;
  final String? userTime;
}

abstract class TrackerRepository {
  Future<List<Tracker>> fetchTrackers();

  Future<Tracker> fetchTrackerById(int trackerId);

  Future<TrackerStatesResult> fetchStates(List<int> trackerIds);
}

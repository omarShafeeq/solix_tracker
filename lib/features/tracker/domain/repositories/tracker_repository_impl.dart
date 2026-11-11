import '../../data/datasources/tracker_remote_datasource.dart';
import '../../data/models/tracker_model.dart';
import '../../data/models/tracker_state_model.dart';
import 'tracker_repository.dart';

class TrackerRepositoryImpl implements TrackerRepository {
  TrackerRepositoryImpl(this._remote);

  final TrackerRemoteDataSource _remote;

  @override
  Future<List<Tracker>> fetchTrackers() {
    return _remote.fetchTrackers();
  }

  @override
  Future<Tracker> fetchTrackerById(int trackerId) {
    return _remote.fetchTrackerById(trackerId);
  }

  @override
  Future<TrackerStatesResult> fetchStates(List<int> trackerIds) async {
    final response = await _remote.fetchStates(trackerIds);
    return TrackerStatesResult(
      states: parseTrackerStateKeys(response.states),
      success: response.success == true,
      userTime: response.userTime,
    );
  }
}

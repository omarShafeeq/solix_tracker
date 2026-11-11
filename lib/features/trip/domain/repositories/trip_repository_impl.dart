import '../../data/datasources/trip_remote_datasource.dart';
import '../../data/models/trip_model.dart';
import 'trip_repository.dart';

class TripRepositoryImpl implements TripRepository {
  TripRepositoryImpl(this._remote);

  final TripRemoteDataSource _remote;

  @override
  Future<List<Trip>> fetchTrips({
    required int trackerId,
    required String from,
    required String to,
  }) {
    return _remote.fetchTrips(trackerId: trackerId, from: from, to: to);
  }
}

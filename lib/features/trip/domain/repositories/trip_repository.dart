import '../../data/models/trip_model.dart';

abstract class TripRepository {
  Future<List<Trip>> fetchTrips({
    required int trackerId,
    required String from,
    required String to,
  });
}

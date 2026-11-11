import '../../../../core/config/app_config.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../models/trip_model.dart';

class TripRemoteDataSource {
  TripRemoteDataSource(this._client, {String? apiHash})
    : _apiHash = apiHash ?? AppConfig.apiHash;

  final ApiClient _client;
  final String _apiHash;

  Future<List<Trip>> fetchTrips({
    required int trackerId,
    required String from,
    required String to,
    bool withPoints = true,
    int? pointLimit,
  }) async {
    if (_apiHash.trim().isEmpty) {
      throw const ConfigurationException(
        'رمز الوصول غير مضبوط. شغّل التطبيق مع --dart-define=API_HASH=your_hash',
      );
    }

    final json = await _client.post(
      ApiEndpoints.trackList,
      body: <String, dynamic>{
        'hash': _apiHash,
        'tracker_id': trackerId,
        'from': from,
        'to': to,
        'with_points': withPoints,
        'point_limit': pointLimit ?? AppConfig.tripPointLimit,
      },
    );
    return TripListResponse.fromJson(json).list;
  }
}

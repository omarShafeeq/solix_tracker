import '../../../../core/config/app_config.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../models/tracker_detail_model.dart';
import '../models/tracker_model.dart';
import '../models/tracker_state_model.dart';

class TrackerRemoteDataSource {
  TrackerRemoteDataSource(this._client, {String? apiHash})
    : _apiHash = apiHash ?? AppConfig.apiHash;

  final ApiClient _client;
  final String _apiHash;

  Future<List<Tracker>> fetchTrackers() async {
    final json = await _client.post(ApiEndpoints.trackerList, body: _body());
    final parsed = TrackerListResponse.fromJson(json);
    return parsed.list.where((tracker) => tracker.id != null).toList();
  }

  Future<Tracker> fetchTrackerById(int trackerId) async {
    final json = await _client.post(
      ApiEndpoints.trackerRead,
      body: _body(<String, dynamic>{'tracker_id': trackerId}),
    );
    final parsed = TrackerReadResponse.fromJson(json);
    if (parsed.success != true ||
        parsed.value == null ||
        parsed.value?.id == null) {
      throw const InvalidResponseException('تفاصيل المتتبع غير متاحة.');
    }
    return parsed.value!;
  }

  Future<TrackerStatesResponse> fetchStates(List<int> trackerIds) async {
    final json = await _client.post(
      ApiEndpoints.trackerStates,
      body: _body(<String, dynamic>{
        'trackers': trackerIds,
        // Blocked devices are still requested so the dashboard can show them
        // as blocked instead of silently dropping them.
        'list_blocked': true,
        'allow_not_exist': true,
      }),
    );
    final parsed = TrackerStatesResponse.fromJson(json);
    if (parsed.success != true) {
      throw const InvalidResponseException('تعذر تحميل حالات المتتبعات.');
    }
    return parsed;
  }

  Map<String, dynamic> _body([Map<String, dynamic> extra = const {}]) {
    if (_apiHash.trim().isEmpty) {
      throw const ConfigurationException(
        'رمز الوصول غير مضبوط. شغّل التطبيق مع --dart-define=API_HASH=your_hash',
      );
    }
    return <String, dynamic>{'hash': _apiHash, ...extra};
  }
}

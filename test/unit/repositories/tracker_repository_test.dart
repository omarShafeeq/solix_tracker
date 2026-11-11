import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:map_yemen_tracker/core/error/exceptions.dart';
import 'package:map_yemen_tracker/core/network/api_client.dart';
import 'package:map_yemen_tracker/features/tracker/data/datasources/tracker_remote_datasource.dart';
import 'package:map_yemen_tracker/features/tracker/domain/repositories/tracker_repository_impl.dart';
import 'package:map_yemen_tracker/features/trip/data/datasources/trip_remote_datasource.dart';
import 'package:map_yemen_tracker/features/trip/domain/repositories/trip_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/samples.dart';

class _MockTrackerRemoteDataSource extends Mock
    implements TrackerRemoteDataSource {}

void main() {
  test('repository returns the datasource tracker list', () async {
    final remote = _MockTrackerRemoteDataSource();
    final repository = TrackerRepositoryImpl(remote);
    when(
      () => remote.fetchTrackers(),
    ).thenAnswer((_) async => [sampleTracker(id: 7)]);

    final trackers = await repository.fetchTrackers();

    expect(trackers.single.id, 7);
    verify(() => remote.fetchTrackers()).called(1);
  });

  test('repository converts state keys to tracker ids', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://example.test'));
    dio.httpClientAdapter = _RouteAdapter({
      '/tracker/list': _listBody,
      '/tracker/read': _readBody,
      '/tracker/get_states': _statesBody,
      '/track/list': _tripBody,
    });
    final client = ApiClient(dio: dio);
    final repository = TrackerRepositoryImpl(
      TrackerRemoteDataSource(client, apiHash: 'test-hash'),
    );
    final trips = TripRepositoryImpl(
      TripRemoteDataSource(client, apiHash: 'test-hash'),
    );

    final trackers = await repository.fetchTrackers();
    final detail = await repository.fetchTrackerById(456);
    final states = await repository.fetchStates(const [456, 9, 10]);
    final history = await trips.fetchTrips(
      trackerId: 456,
      from: '2026-09-01 03:24:00',
      to: '2026-09-05 06:24:00',
    );

    expect(trackers.single.id, 450);
    expect(detail.label, contains('كناسة'));
    expect(states.success, isTrue);
    expect(states.states[456]?.gps?.speed, 0);
    expect(states.states[9]?.gps, isNull);
    expect(states.states[10], isNull);
    expect(states.states.containsKey(10), isTrue);
    expect(history.single.pointsList, isNotEmpty);
  });

  test('repository reports an unsuccessful details response', () async {
    final dio = Dio(BaseOptions(baseUrl: 'https://example.test'));
    dio.httpClientAdapter = _RouteAdapter(const {
      '/tracker/read': '{"success": false, "value": null}',
    });
    final repository = TrackerRepositoryImpl(
      TrackerRemoteDataSource(ApiClient(dio: dio), apiHash: 'test-hash'),
    );

    expect(
      repository.fetchTrackerById(1),
      throwsA(isA<InvalidResponseException>()),
    );
  });

  test('datasource does not call the network without an API hash', () async {
    final source = TrackerRemoteDataSource(
      ApiClient(dio: Dio()),
      apiHash: '   ',
    );

    expect(source.fetchTrackers(), throwsA(isA<ConfigurationException>()));
  });
}

class _RouteAdapter implements HttpClientAdapter {
  _RouteAdapter(this.routes);

  final Map<String, String> routes;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final body = routes[options.path] ?? '{"success": false}';
    return ResponseBody.fromString(
      body,
      routes.containsKey(options.path) ? 200 : 404,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

const _listBody = '''
{"list":[{"id":450,"label":"365-الرقم الاداري","group_id":135,"source":{"id":442,"blocked":false,"device_id":"864275076915639","model":"telfmu130_fmc130"},"tag_bindings":[],"clone":false}]}
''';

const _readBody = '''
{"success":true,"value":{"id":456,"label":"Gov/10762|كناسة طرقات","group_id":2519,"source":{"id":448,"blocked":false},"tag_bindings":[],"clone":false}}
''';

const _statesBody = '''
{"success":true,"user_time":"2026-10-28 15:50:07","states":{"456":{"gps":{"speed":0,"location":{"lat":12.8,"lng":44.9}},"connection_status":"active"},"9":{"connection_status":"inactive"},"10":null}}
''';

final _tripBody = jsonEncode({
  'list': [
    {
      'id': 5,
      'start_date': '2026-09-02 01:50:09',
      'end_date': '2026-09-02 02:09:54',
      'points_list': [
        {'lat': 12.1, 'lng': 44.2},
      ],
    },
  ],
});

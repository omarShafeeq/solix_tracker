import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:map_yemen_tracker/features/trip/data/models/trip_model.dart';

void main() {
  test('parses trips, points, and bounds', () {
    final response = TripListResponse.fromJson(
      jsonDecode(_tripJson) as Map<String, dynamic>,
    );
    final trip = response.list.single;

    expect(trip.id, 10102);
    expect(trip.startDate, '2026-09-02 01:50:09');
    expect(trip.endDate, '2026-09-02 02:09:54');
    expect(trip.avgSpeed, 3);
    expect(trip.maxSpeed, 16);
    expect(trip.length, closeTo(0.99, 0.001));
    expect(trip.points, 44);
    expect(trip.pointsList, hasLength(1));
    expect(trip.pointsList.first.lat, closeTo(12.9424516, 0.0000001));
    expect(trip.pointsList.first.mileage, 0);
    expect(trip.pointsList.first.buffered, isTrue);
    expect(trip.bounds?.nw?.lat, closeTo(12.9429266, 0.0000001));
    expect(trip.bounds?.se?.lng, closeTo(44.9610866, 0.0000001));
    expect(trip.startAddress, contains('لحج'));
    expect(trip.endAddress, contains('مسجد'));
  });

  test('accepts a trip without points', () {
    final trip = Trip.fromJson(const {
      'id': 1,
      'start_date': '2026-09-02 01:50:09',
      'points_list': null,
    });

    expect(trip.pointsList, isEmpty);
    expect(trip.bounds, isNull);
  });
}

const _tripJson = '''
{
  "list": [
    {
      "id": 10102,
      "start_date": "2026-09-02 01:50:09",
      "avg_speed": 3,
      "points_list": [
        {
          "lat": 12.9424516,
          "lng": 44.957855,
          "address": "لحج, م .تبن, طريق عدن-تعز",
          "satellites": 16,
          "mileage": 0.0,
          "heading": 44,
          "speed": 0,
          "buffered": true,
          "alt": 43,
          "get_time": "2026-09-02 01:50:09"
        }
      ],
      "end_date": "2026-09-02 02:09:54",
      "length": 0.99,
      "max_speed": 16,
      "end_address": "لحج, م .تبن, طريق عدن-تعز, مسجد الشهداء",
      "bounds": {
        "nw": { "lat": 12.9429266, "lng": 44.957855 },
        "se": { "lat": 12.9411633, "lng": 44.9610866 }
      },
      "type": "regular",
      "start_address": "لحج, م .تبن, طريق عدن-تعز",
      "points": 44
    }
  ]
}
''';

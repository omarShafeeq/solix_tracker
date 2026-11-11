import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:map_yemen_tracker/features/tracker/data/models/tracker_detail_model.dart';
import 'package:map_yemen_tracker/features/tracker/data/models/tracker_state_model.dart';

void main() {
  test('parses tracker details and an empty tag list', () {
    final response = TrackerReadResponse.fromJson(
      jsonDecode(_detailJson) as Map<String, dynamic>,
    );

    expect(response.success, isTrue);
    expect(response.value?.id, 456);
    expect(response.value?.label, 'Gov/10762|كناسة طرقات');
    expect(response.value?.tagBindings, isEmpty);
    expect(response.value?.source?.phone, '967722053023');
    expect(response.value?.source?.statusListingId, isNull);
  });

  test('parses dynamic state keys, null states, and missing GPS', () {
    final response = TrackerStatesResponse.fromJson(
      jsonDecode(_statesJson) as Map<String, dynamic>,
    );
    final parsed = parseTrackerStateKeys(response.states);

    expect(response.success, isTrue);
    expect(response.userTime, '2026-10-28 15:50:07');
    expect(parsed.containsKey(456), isTrue);
    expect(parsed[456]?.gps?.location?.lat, closeTo(12.8956633, 0.0000001));
    expect(parsed[456]?.gps?.location?.lng, closeTo(44.9793599, 0.0000001));
    expect(parsed[456]?.gps?.heading, 141);
    expect(parsed[456]?.gps?.speed, 0);
    expect(parsed[456]?.connectionStatus, 'active');
    expect(parsed[456]?.movementStatus, 'parked');
    expect(parsed[456]?.gsm?.networkName, 'Sabaphone');
    expect(parsed[456]?.batteryLevel, 100);
    expect(parsed[456]?.inputs, [false, false, false, false]);
    expect(parsed[456]?.additional['moving']?.value, '0');
    expect(parsed[9]?.gps, isNull);
    expect(parsed[9]?.connectionStatus, 'inactive');
    expect(parsed[10], isNull);
    expect(parsed.containsKey(0), isFalse);
  });
}

const _detailJson = '''
{
  "value": {
    "id": 456,
    "label": "Gov/10762|كناسة طرقات",
    "group_id": 2519,
    "source": {
      "status_listing_id": null,
      "creation_date": "2021-12-24",
      "id": 448,
      "blocked": false,
      "device_id": "864275079196302",
      "tariff_id": 39,
      "model": "telfmu130_fmc130",
      "tariff_end_date": "2026-11-01",
      "phone": "967722053023"
    },
    "tag_bindings": [],
    "clone": false
  },
  "success": true
}
''';

const _statesJson = '''
{
  "user_time": "2026-10-28 15:50:07",
  "states": {
    "456": {
      "source_id": 448,
      "gps": {
        "updated": "2026-10-28 15:46:01",
        "signal_level": 100,
        "location": { "lat": 12.8956633, "lng": 44.9793599 },
        "heading": 141,
        "speed": 0,
        "alt": 25
      },
      "connection_status": "active",
      "movement_status": "parked",
      "movement_status_update": "2026-10-28 09:41:01",
      "ignition": false,
      "ignition_update": "2026-10-28 09:34:14",
      "inputs": [false, false, false, false],
      "outputs": [false, false, false],
      "last_update": "2026-10-28 15:46:05",
      "gsm": {
        "updated": "2026-10-28 15:46:01",
        "signal_level": 80,
        "network_name": "Sabaphone",
        "roaming": false
      },
      "battery_level": 100,
      "battery_update": "2026-10-28 15:46:01",
      "additional": {
        "moving": { "value": "0", "updated": "2026-10-28 15:46:01" },
        "event_code": { "value": 0, "updated": "2026-10-28 15:46:01" }
      },
      "actual_track_update": "2026-10-28 09:41:01"
    },
    "9": { "connection_status": "inactive" },
    "10": null,
    "not-a-number": { "connection_status": "active" }
  },
  "success": true
}
''';

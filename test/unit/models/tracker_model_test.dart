import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:map_yemen_tracker/features/tracker/data/models/tracker_model.dart';

void main() {
  test('parses a tracker list item with nullable source fields', () {
    final response = TrackerListResponse.fromJson(
      jsonDecode(_trackerListJson) as Map<String, dynamic>,
    );

    final tracker = response.list.single;
    expect(tracker.id, 450);
    expect(tracker.label, '365-الرقم الاداري');
    expect(tracker.groupId, 135);
    expect(tracker.clone, isFalse);
    expect(tracker.source?.statusListingId, isNull);
    expect(tracker.source?.blocked, isFalse);
    expect(tracker.source?.deviceId, '864275076915639');
    expect(tracker.source?.model, 'telfmu130_fmc130');
    expect(tracker.source?.phone, '967722053286');
    expect(tracker.tagBindings.single.tagId, 19793);
    expect(tracker.tagBindings.single.ordinal, 1);
  });

  test('treats a missing or null tag list as empty', () {
    final missing = Tracker.fromJson(const {'id': 1, 'label': 'A'});
    final explicitNull = Tracker.fromJson(const {
      'id': 2,
      'label': 'B',
      'tag_bindings': null,
    });

    expect(missing.tagBindings, isEmpty);
    expect(explicitNull.tagBindings, isEmpty);
    expect(missing.source, isNull);
  });
}

const _trackerListJson = '''
{
  "list": [
    {
      "id": 450,
      "label": "365-الرقم الاداري",
      "group_id": 135,
      "source": {
        "status_listing_id": null,
        "id": 442,
        "creation_date": "2021-12-24",
        "blocked": false,
        "device_id": "864275076915639",
        "tariff_id": 39,
        "model": "telfmu130_fmc130",
        "tariff_end_date": "2026-12-01",
        "phone": "967722053286"
      },
      "tag_bindings": [
        { "tag_id": 19793, "ordinal": 1 }
      ],
      "clone": false
    }
  ]
}
''';

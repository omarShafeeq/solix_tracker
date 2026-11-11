import 'package:flutter_test/flutter_test.dart';
import 'package:map_yemen_tracker/features/map/presentation/marker_factory.dart';

import '../helpers/samples.dart';

void main() {
  test('skips trackers without a valid GPS fix', () {
    final drafts = buildTrackerMarkerDrafts(
      trackers: [
        sampleTracker(id: 1, label: 'Valid'),
        sampleTracker(id: 2, label: 'Missing'),
        sampleTracker(id: 3, label: 'Broken'),
      ],
      states: {
        1: sampleGpsState(),
        2: sampleGpsState(includeGps: false),
        3: sampleGpsState(latitude: 120, longitude: 44),
      },
      visibleIds: const {1, 2, 3},
    );

    expect(drafts.map((draft) => draft.id), [1]);
    expect(drafts.single.tone, MarkerTone.parked);
  });

  test('hides trackers that are not selected for the map', () {
    final drafts = buildTrackerMarkerDrafts(
      trackers: [sampleTracker(id: 1), sampleTracker(id: 2)],
      states: {1: sampleGpsState(), 2: sampleGpsState()},
      visibleIds: const {2},
    );

    expect(drafts.single.id, 2);
  });

  test('uses blocked, offline, and moving tones', () {
    expect(
      toneForTracker(blocked: true, state: sampleGpsState()),
      MarkerTone.blocked,
    );
    expect(
      toneForTracker(
        blocked: false,
        state: sampleGpsState(connectionStatus: 'offline'),
      ),
      MarkerTone.offline,
    );
    expect(
      toneForTracker(
        blocked: false,
        state: sampleGpsState(movementStatus: 'moving'),
      ),
      MarkerTone.online,
    );
  });
}

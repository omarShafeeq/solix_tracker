import 'package:bloc_test/bloc_test.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:map_yemen_tracker/core/error/exceptions.dart';
import 'package:map_yemen_tracker/features/tracker/data/models/tracker_model.dart';
import 'package:map_yemen_tracker/features/tracker/domain/repositories/tracker_repository.dart';
import 'package:map_yemen_tracker/features/tracker/presentation/cubits/live_tracking_cubit.dart';
import 'package:map_yemen_tracker/features/tracker/presentation/cubits/tracker_details_cubit.dart';
import 'package:map_yemen_tracker/features/tracker/presentation/cubits/tracker_details_state.dart';
import 'package:map_yemen_tracker/features/tracker/presentation/cubits/trackers_cubit.dart';
import 'package:map_yemen_tracker/features/tracker/presentation/cubits/trackers_state.dart';

import '../../helpers/samples.dart';

void main() {
  test('loads, searches, filters, and selects trackers', () async {
    final repository = FakeTrackerRepository(
      trackers: [
        sampleTracker(id: 1, label: 'Alpha'),
        sampleTracker(id: 2, label: 'Beta', blocked: true),
      ],
    );
    final cubit = TrackersCubit(repository);
    await cubit.loadTrackers();

    expect(cubit.state.status, TrackersStatus.success);
    expect(cubit.state.visibleTrackerIds, {1, 2});

    cubit.syncLiveStates({
      1: sampleGpsState(connectionStatus: 'active', movementStatus: 'moving'),
      2: sampleGpsState(connectionStatus: 'offline', movementStatus: 'parked'),
    });
    cubit.search('beta');
    expect(cubit.state.filteredTrackers.single.id, 2);

    cubit.search('');
    cubit.setFilter(TrackerFilter.online);
    expect(cubit.state.filteredTrackers.single.id, 1);
    expect(cubit.state.mapTrackerIds, {1});
    cubit.setFilter(TrackerFilter.moving);
    expect(cubit.state.mapTrackerIds, {1});
    cubit.setFilter(TrackerFilter.parked);
    expect(cubit.state.mapTrackerIds, {2});
    cubit.setFilter(TrackerFilter.all);
    expect(cubit.state.mapTrackerIds, {1, 2});
    cubit.setListedVisible(false);
    expect(cubit.state.visibleTrackerIds, isEmpty);
    expect(cubit.state.mapTrackerIds, isEmpty);
    cubit.setListedVisible(true);
    expect(cubit.state.mapTrackerIds, {1, 2});
    cubit.setFilter(TrackerFilter.blocked);
    expect(cubit.state.filteredTrackers.single.id, 2);

    cubit.selectTracker(1);
    expect(cubit.state.selectedTrackerId, 1);
    cubit.toggleVisibility(1);
    expect(cubit.state.visibleTrackerIds.contains(1), isFalse);
    cubit.showAllOnMap();
    expect(cubit.state.visibleTrackerIds, {1, 2});
    await cubit.close();
  });

  blocTest<TrackersCubit, TrackersState>(
    'keeps the previous list when a refresh fails',
    build: () => TrackersCubit(_FailOnSecondList(FakeTrackerRepository())),
    act: (cubit) async {
      await cubit.loadTrackers();
      await cubit.loadTrackers();
    },
    verify: (cubit) {
      expect(cubit.state.trackers, isNotEmpty);
      expect(cubit.state.isStale, isTrue);
      expect(cubit.state.errorMessage, isNotNull);
    },
  );

  test('selected tracker state comes from the live GPS map', () async {
    final repository = FakeTrackerRepository(
      states: {7: sampleGpsState(speed: 42)},
    );
    final cubit = LiveTrackingCubit(
      repository,
      refreshInterval: const Duration(seconds: 30),
    );
    cubit.updateTrackerIds(const [7]);
    await cubit.refreshStates();

    expect(cubit.state.stateFor(7)?.gps?.speed, 42);
    expect(cubit.state.stateFor(8), isNull);
    expect(cubit.state.isStale, isFalse);
    await cubit.close();
  });

  test('keeps the last GPS fix when a refresh fails', () async {
    final repository = _FailingStateRepository();
    final cubit = LiveTrackingCubit(
      repository,
      refreshInterval: const Duration(seconds: 30),
    );
    cubit.updateTrackerIds(const [7]);
    await cubit.refreshStates();
    await cubit.refreshStates();

    expect(cubit.state.stateFor(7)?.gps?.location?.lat, isNotNull);
    expect(cubit.state.isStale, isTrue);
    expect(cubit.state.errorMessage, contains('internet'));
    await cubit.close();
  });

  test('batches tracker ids into configurable requests', () async {
    final repository = FakeTrackerRepository();
    final cubit = LiveTrackingCubit(
      repository,
      refreshInterval: const Duration(seconds: 30),
      batchSize: 2,
    );
    cubit.updateTrackerIds(const [1, 2, 3, 4, 5]);
    await cubit.refreshStates();

    expect(repository.batches, [
      [1, 2],
      [3, 4],
      [5],
    ]);
    await cubit.close();
  });

  test('stops the periodic refresh when the cubit is closed', () {
    fakeAsync((async) {
      final repository = FakeTrackerRepository();
      final cubit = LiveTrackingCubit(
        repository,
        refreshInterval: const Duration(seconds: 10),
      );
      cubit.startTracking(const [1]);
      async.flushMicrotasks();
      expect(repository.stateCalls, 1);

      async.elapse(const Duration(seconds: 10));
      async.flushMicrotasks();
      expect(repository.stateCalls, 2);

      cubit.close();
      async.elapse(const Duration(seconds: 30));
      async.flushMicrotasks();
      expect(repository.stateCalls, 2);
    });
  });

  test('does not request the same tracker details twice', () async {
    final repository = FakeTrackerRepository();
    final cubit = TrackerDetailsCubit(repository);
    await cubit.loadDetails(450);
    await cubit.loadDetails(450);
    expect(repository.detailCalls, 1);
    expect(cubit.state.status, TrackerDetailsStatus.loaded);

    await cubit.loadDetails(450, force: true);
    expect(repository.detailCalls, 2);
    await cubit.close();
  });
}

class _FailOnSecondList implements TrackerRepository {
  _FailOnSecondList(this._inner);

  final FakeTrackerRepository _inner;
  int _calls = 0;

  @override
  Future<List<Tracker>> fetchTrackers() async {
    _calls++;
    if (_calls > 1) {
      throw const NetworkException(
        'No internet connection. The last loaded data is still shown.',
      );
    }
    return _inner.fetchTrackers();
  }

  @override
  Future<Tracker> fetchTrackerById(int trackerId) {
    return _inner.fetchTrackerById(trackerId);
  }

  @override
  Future<TrackerStatesResult> fetchStates(List<int> trackerIds) {
    return _inner.fetchStates(trackerIds);
  }
}

class _FailingStateRepository extends FakeTrackerRepository {
  @override
  Future<TrackerStatesResult> fetchStates(List<int> trackerIds) async {
    stateCalls++;
    batches.add(List<int>.from(trackerIds));
    if (stateCalls > 1) {
      throw const NetworkException(
        'No internet connection. The last loaded data is still shown.',
      );
    }
    return TrackerStatesResult(
      success: true,
      userTime: '2026-10-28 15:50:07',
      states: {for (final id in trackerIds) id: sampleGpsState()},
    );
  }
}

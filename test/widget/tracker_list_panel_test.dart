import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:map_yemen_tracker/features/tracker/presentation/cubits/trackers_cubit.dart';
import 'package:map_yemen_tracker/features/tracker/presentation/widgets/tracker_list_panel.dart';

import '../helpers/samples.dart';

void main() {
  testWidgets('searches trackers by label', (tester) async {
    final cubit = TrackersCubit(
      FakeTrackerRepository(
        trackers: [
          sampleTracker(id: 1, label: 'Alpha'),
          sampleTracker(id: 2, label: 'Beta'),
        ],
      ),
    );
    await cubit.loadTrackers();
    addTearDown(cubit.close);

    await tester.pumpWidget(_wrap(cubit));
    expect(find.byKey(const Key('tracker_item_1')), findsOneWidget);
    expect(find.text('2'), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key('tracker_search_field')),
      'Beta',
    );
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.byKey(const Key('tracker_item_2')), findsOneWidget);
    expect(find.byKey(const Key('tracker_item_1')), findsNothing);
    expect(find.text('1 / 2'), findsOneWidget);
  });

  testWidgets('filters the list by live status', (tester) async {
    final cubit = TrackersCubit(
      FakeTrackerRepository(
        trackers: [
          sampleTracker(id: 1, label: 'Alpha'),
          sampleTracker(id: 2, label: 'Beta', blocked: true),
        ],
      ),
    );
    await cubit.loadTrackers();
    cubit.syncLiveStates({
      1: sampleGpsState(connectionStatus: 'active', movementStatus: 'moving'),
      2: sampleGpsState(connectionStatus: 'offline', movementStatus: 'parked'),
    });
    addTearDown(cubit.close);

    await tester.pumpWidget(_wrap(cubit));
    await tester.tap(find.byKey(const Key('filter_offline')));
    await tester.pump();

    expect(find.byKey(const Key('tracker_item_2')), findsOneWidget);
    expect(find.byKey(const Key('tracker_item_1')), findsNothing);

    await tester.tap(find.byKey(const Key('filter_blocked')));
    await tester.pump();
    expect(find.byKey(const Key('tracker_item_2')), findsOneWidget);

    await tester.tap(find.byKey(const Key('tracker_visibility_2')));
    await tester.pump();
    expect(cubit.state.visibleTrackerIds.contains(2), isFalse);
  });
}

Widget _wrap(TrackersCubit cubit) {
  return MaterialApp(
    home: Scaffold(
      body: SizedBox(
        width: 350,
        height: 800,
        child: BlocProvider<TrackersCubit>.value(
          value: cubit,
          child: const TrackerListPanel(),
        ),
      ),
    ),
  );
}

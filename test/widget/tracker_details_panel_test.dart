import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:map_yemen_tracker/features/tracker/presentation/cubits/live_tracking_cubit.dart';
import 'package:map_yemen_tracker/features/tracker/presentation/cubits/tracker_details_cubit.dart';
import 'package:map_yemen_tracker/features/tracker/presentation/cubits/trackers_cubit.dart';
import 'package:map_yemen_tracker/features/tracker/presentation/widgets/tracker_details_panel.dart';

import '../helpers/samples.dart';

void main() {
  testWidgets('shows tracker details and unavailable mileage', (tester) async {
    tester.view.physicalSize = const Size(1200, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final repository = FakeTrackerRepository(
      trackers: [sampleTracker(id: 450, label: 'Road sweeper')],
      states: {450: sampleGpsState()},
    );
    final trackers = TrackersCubit(repository);
    final details = TrackerDetailsCubit(repository);
    final live = LiveTrackingCubit(
      repository,
      refreshInterval: const Duration(seconds: 30),
    );
    addTearDown(trackers.close);
    addTearDown(details.close);
    addTearDown(live.close);

    await trackers.loadTrackers();
    trackers.selectTracker(450);
    await details.loadDetails(450);
    live.updateTrackerIds(const [450]);
    await live.refreshStates();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 380,
            height: 900,
            child: MultiBlocProvider(
              providers: [
                BlocProvider<TrackersCubit>.value(value: trackers),
                BlocProvider<TrackerDetailsCubit>.value(value: details),
                BlocProvider<LiveTrackingCubit>.value(value: live),
              ],
              child: const TrackerDetailsPanel(),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Road sweeper'), findsWidgets);
    expect(find.text('معلومات عامة'), findsOneWidget);
    expect(find.text('864275076915639'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('معلومات شبكة الجوال'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('معلومات شبكة الجوال'));
    await tester.pumpAndSettle();
    expect(find.text('Sabaphone'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('المسافة المقطوعة').first,
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('المسافة المقطوعة').first);
    await tester.pumpAndSettle();
    expect(find.text('غير متوفر'), findsWidgets);
  });
}

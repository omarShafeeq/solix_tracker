import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:map_yemen_tracker/features/dashboard/presentation/widgets/responsive_layout.dart';

void main() {
  testWidgets('desktop layout shows the list, details, and map together', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(1440, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DashboardLayout(
            breakpoint: DashboardBreakpoint.desktop,
            list: Text('LIST_PANEL'),
            details: Text('DETAILS_PANEL'),
            map: Text('MAP_PANEL'),
          ),
        ),
      ),
    );

    expect(find.text('LIST_PANEL'), findsOneWidget);
    expect(find.text('DETAILS_PANEL'), findsOneWidget);
    expect(find.text('MAP_PANEL'), findsOneWidget);
  });

  testWidgets('mobile layout keeps side panels off the map', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DashboardLayout(
            breakpoint: DashboardBreakpoint.mobile,
            list: Text('LIST_PANEL'),
            details: Text('DETAILS_PANEL'),
            map: Text('MAP_PANEL'),
          ),
        ),
      ),
    );

    expect(find.text('MAP_PANEL'), findsOneWidget);
    expect(find.text('LIST_PANEL'), findsNothing);
    expect(find.text('DETAILS_PANEL'), findsNothing);
    expect(find.byKey(const Key('open_tracker_list')), findsOneWidget);
    expect(find.byKey(const Key('open_tracker_details')), findsOneWidget);
    expect(find.byKey(const Key('open_trip_history')), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:map_yemen_tracker/features/map/presentation/cubits/map_cubit.dart';
import 'package:map_yemen_tracker/features/map/presentation/cubits/map_state.dart';
import 'package:map_yemen_tracker/features/map/presentation/widgets/map_controls.dart';

void main() {
  testWidgets('the layer toggle switches imagery without moving the camera', (
    tester,
  ) async {
    final cubit = MapCubit()
      ..syncSelection(4)
      ..syncVisibleIds({4, 9});
    addTearDown(cubit.close);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<MapCubit>.value(
          value: cubit,
          child: const Scaffold(body: MapImageryToggle()),
        ),
      ),
    );

    expect(find.text('شوارع'), findsOneWidget);
    expect(find.text('قمر صناعي'), findsOneWidget);

    await tester.tap(find.byKey(const Key('map_imagery_satellite')));
    await tester.pump();

    expect(cubit.state.imagery, MapImagery.satellite);
    expect(cubit.state.selectedTrackerId, 4);
    expect(cubit.state.visibleTrackerIds, {4, 9});
    expect(cubit.state.cameraCommandId, 0);

    await tester.tap(find.byKey(const Key('map_imagery_street')));
    await tester.pump();

    expect(cubit.state.imagery, MapImagery.street);
    expect(cubit.state.cameraCommandId, 0);
  });

  testWidgets('attribution follows the active imagery provider', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              MapAttribution(imagery: MapImagery.street),
              MapAttribution(imagery: MapImagery.satellite),
            ],
          ),
        ),
      ),
    );

    expect(find.text('© مساهمو OpenStreetMap'), findsOneWidget);
    expect(find.textContaining('Powered by'), findsOneWidget);
    expect(find.text('Esri'), findsOneWidget);
    expect(
      find.textContaining('Vantor, Earthstar Geographics'),
      findsOneWidget,
    );
  });
}

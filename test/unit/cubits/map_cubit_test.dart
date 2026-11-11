import 'package:bloc_test/bloc_test.dart';
import 'package:map_yemen_tracker/features/map/presentation/cubits/map_cubit.dart';
import 'package:map_yemen_tracker/features/map/presentation/cubits/map_state.dart';

void main() {
  blocTest<MapCubit, MapCubitState>(
    'switching imagery keeps selection, markers, and the camera command',
    build: MapCubit.new,
    seed: () => const MapCubitState(
      selectedTrackerId: 12,
      visibleTrackerIds: {12, 15},
      cameraCommandId: 3,
      cameraAction: CameraAction.focusTracker,
      focusTrackerId: 12,
    ),
    act: (cubit) => cubit.setImagery(MapImagery.satellite),
    expect: () => [
      const MapCubitState(
        imagery: MapImagery.satellite,
        selectedTrackerId: 12,
        visibleTrackerIds: {12, 15},
        cameraCommandId: 3,
        cameraAction: CameraAction.focusTracker,
        focusTrackerId: 12,
      ),
    ],
  );

  blocTest<MapCubit, MapCubitState>(
    'ignores a repeated imagery choice',
    build: MapCubit.new,
    act: (cubit) {
      cubit.setImagery(MapImagery.satellite);
      cubit.setImagery(MapImagery.satellite);
    },
    expect: () => [const MapCubitState(imagery: MapImagery.satellite)],
  );

  blocTest<MapCubit, MapCubitState>(
    'can return to the street layer',
    build: MapCubit.new,
    seed: () => const MapCubitState(imagery: MapImagery.satellite),
    act: (cubit) => cubit.setImagery(MapImagery.street),
    expect: () => [const MapCubitState(imagery: MapImagery.street)],
  );
}

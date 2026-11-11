import 'package:flutter_bloc/flutter_bloc.dart';

import 'map_state.dart';

class MapCubit extends Cubit<MapCubitState> {
  MapCubit() : super(const MapCubitState());

  void syncSelection(int? trackerId) {
    if (trackerId == null) {
      emit(state.copyWith(clearSelection: true));
      return;
    }
    emit(state.copyWith(selectedTrackerId: trackerId));
  }

  void syncVisibleIds(Set<int> ids) {
    emit(state.copyWith(visibleTrackerIds: Set<int>.from(ids)));
  }

  void focusOnTracker(int trackerId) {
    emit(
      state.copyWith(
        selectedTrackerId: trackerId,
        cameraCommandId: state.cameraCommandId + 1,
        cameraAction: CameraAction.focusTracker,
        focusTrackerId: trackerId,
      ),
    );
  }

  void fitAllMarkers() {
    emit(
      state.copyWith(
        cameraCommandId: state.cameraCommandId + 1,
        cameraAction: CameraAction.fitVisible,
      ),
    );
  }

  void fitToBounds({
    required double north,
    required double south,
    required double east,
    required double west,
  }) {
    emit(
      state.copyWith(
        cameraCommandId: state.cameraCommandId + 1,
        cameraAction: CameraAction.fitBounds,
        north: north,
        south: south,
        east: east,
        west: west,
      ),
    );
  }

  void setShowLiveMarkers(bool visible) {
    emit(state.copyWith(showLiveMarkers: visible));
  }

  void setShowTripRoute(bool visible) {
    emit(state.copyWith(showTripRoute: visible));
  }

  void setImagery(MapImagery imagery) {
    if (imagery == state.imagery) {
      return;
    }
    emit(state.copyWith(imagery: imagery));
  }
}

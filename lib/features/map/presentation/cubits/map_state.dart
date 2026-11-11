import 'package:equatable/equatable.dart';

enum CameraAction { none, focusTracker, fitVisible, fitBounds }

enum MapImagery { street, satellite }

class MapCubitState extends Equatable {
  const MapCubitState({
    this.selectedTrackerId,
    this.visibleTrackerIds = const <int>{},
    this.showLiveMarkers = true,
    this.showTripRoute = true,
    this.imagery = MapImagery.street,
    this.cameraCommandId = 0,
    this.cameraAction = CameraAction.none,
    this.focusTrackerId,
    this.north,
    this.south,
    this.east,
    this.west,
  });

  final int? selectedTrackerId;
  final Set<int> visibleTrackerIds;
  final bool showLiveMarkers;
  final bool showTripRoute;
  final MapImagery imagery;
  final int cameraCommandId;
  final CameraAction cameraAction;
  final int? focusTrackerId;
  final double? north;
  final double? south;
  final double? east;
  final double? west;

  MapCubitState copyWith({
    int? selectedTrackerId,
    bool clearSelection = false,
    Set<int>? visibleTrackerIds,
    bool? showLiveMarkers,
    bool? showTripRoute,
    MapImagery? imagery,
    int? cameraCommandId,
    CameraAction? cameraAction,
    int? focusTrackerId,
    double? north,
    double? south,
    double? east,
    double? west,
  }) {
    return MapCubitState(
      selectedTrackerId: clearSelection
          ? null
          : selectedTrackerId ?? this.selectedTrackerId,
      visibleTrackerIds: visibleTrackerIds ?? this.visibleTrackerIds,
      showLiveMarkers: showLiveMarkers ?? this.showLiveMarkers,
      showTripRoute: showTripRoute ?? this.showTripRoute,
      imagery: imagery ?? this.imagery,
      cameraCommandId: cameraCommandId ?? this.cameraCommandId,
      cameraAction: cameraAction ?? this.cameraAction,
      focusTrackerId: focusTrackerId ?? this.focusTrackerId,
      north: north ?? this.north,
      south: south ?? this.south,
      east: east ?? this.east,
      west: west ?? this.west,
    );
  }

  @override
  List<Object?> get props => [
    selectedTrackerId,
    visibleTrackerIds,
    showLiveMarkers,
    showTripRoute,
    imagery,
    cameraCommandId,
    cameraAction,
    focusTrackerId,
    north,
    south,
    east,
    west,
  ];
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/coordinate_utils.dart';
import '../../../tracker/presentation/cubits/live_tracking_cubit.dart';
import '../../../tracker/presentation/cubits/live_tracking_state.dart';
import '../../../tracker/presentation/cubits/trackers_cubit.dart';
import '../../../tracker/presentation/cubits/trackers_state.dart';
import '../../../trip/presentation/cubits/trip_history_cubit.dart';
import '../../../trip/presentation/cubits/trip_history_state.dart';
import '../../../trip/presentation/trip_bounds.dart';
import '../cubits/map_cubit.dart';
import '../cubits/map_state.dart';
import '../map_imagery_style.dart';
import '../marker_factory.dart';
import '../vehicle_marker.dart';
import 'map_controls.dart';
import 'tracker_info_card.dart';

class MapArea extends StatefulWidget {
  const MapArea({super.key});

  @override
  State<MapArea> createState() => _MapAreaState();
}

class _MapAreaState extends State<MapArea> {
  static const LatLng _yemenCenter = LatLng(15.5527, 48.5164);

  final MapController _mapController = MapController();
  bool _ready = false;
  double _zoom = 6;
  MapCubitState? _pendingCamera;
  bool _didInitialFit = false;
  List<Marker> _markers = const [];
  List<Polyline> _polylines = const [];
  String _signature = '';

  double get _maxZoom => MapImageryStyle.forImagery(
    context.read<MapCubit>().state.imagery,
  ).maxZoom.toDouble();

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imagery = context.select<MapCubit, MapImagery>(
      (cubit) => cubit.state.imagery,
    );
    final tiles = MapImageryStyle.forImagery(imagery);
    return MultiBlocListener(
      listeners: [
        BlocListener<MapCubit, MapCubitState>(
          listenWhen: (previous, current) =>
              previous.imagery != current.imagery,
          listener: (context, state) => _clampZoomForImagery(state.imagery),
        ),
        BlocListener<LiveTrackingCubit, LiveTrackingState>(
          listenWhen: (previous, current) => previous.states != current.states,
          listener: (context, state) {
            if (!_didInitialFit &&
                state.states.values.any(
                  (gps) => isValidCoordinate(
                    gps?.gps?.location?.lat,
                    gps?.gps?.location?.lng,
                  ),
                )) {
              _didInitialFit = true;
              context.read<MapCubit>().fitAllMarkers();
            }
            _syncOverlays();
          },
        ),
        BlocListener<MapCubit, MapCubitState>(
          listenWhen: (previous, current) =>
              previous.visibleTrackerIds != current.visibleTrackerIds ||
              previous.selectedTrackerId != current.selectedTrackerId ||
              previous.showLiveMarkers != current.showLiveMarkers ||
              previous.showTripRoute != current.showTripRoute,
          listener: (context, state) => _syncOverlays(),
        ),
        BlocListener<MapCubit, MapCubitState>(
          listenWhen: (previous, current) =>
              previous.cameraCommandId != current.cameraCommandId,
          listener: (context, state) => _applyCamera(state),
        ),
        BlocListener<TripHistoryCubit, TripHistoryState>(
          listenWhen: (previous, current) =>
              previous.selectedTripIndex != current.selectedTripIndex ||
              previous.playbackIndex != current.playbackIndex ||
              previous.playbackStatus != current.playbackStatus ||
              previous.trips != current.trips,
          listener: (context, state) => _syncOverlays(),
        ),
        BlocListener<TrackersCubit, TrackersState>(
          listenWhen: (previous, current) =>
              previous.trackers != current.trackers,
          listener: (context, state) => _syncOverlays(),
        ),
      ],
      child: Column(
        children: [
          const MapLiveBar(),
          Expanded(
            child: Stack(
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: _yemenCenter,
                    initialZoom: 6,
                    minZoom: 3,
                    maxZoom: tiles.maxZoom.toDouble(),
                    backgroundColor: imagery == MapImagery.satellite
                        ? const Color(0xFF101820)
                        : const Color(0xFFE6EEF6),
                    interactionOptions: const InteractionOptions(
                      flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
                    ),
                    onMapReady: _onMapReady,
                    onPositionChanged: _onPositionChanged,
                  ),
                  children: [
                    TileLayer(
                      key: ValueKey(imagery),
                      urlTemplate: tiles.urlTemplate,
                      userAgentPackageName: 'map_yemen_tracker',
                      maxZoom: tiles.maxZoom.toDouble(),
                      maxNativeZoom: tiles.maxZoom,
                    ),
                    PolylineLayer(polylines: _polylines),
                    MarkerLayer(markers: _markers),
                  ],
                ),
                const Positioned(top: 64, left: 12, child: TrackerInfoCard()),
                const Positioned(
                  top: 12,
                  left: 12,
                  right: 248,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: MapStatusBanner(),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Column(
                    textDirection: TextDirection.ltr,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const MapImageryToggle(),
                      const SizedBox(height: 8),
                      MapControls(
                        onZoomIn: () => _zoomBy(1),
                        onZoomOut: () => _zoomBy(-1),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 12,
                  bottom: 64,
                  child: MapAttribution(imagery: imagery),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onMapReady() {
    _ready = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      final pending = _pendingCamera;
      if (pending != null) {
        _pendingCamera = null;
        _applyCamera(pending);
      }
      _syncOverlays();
    });
  }

  void _onPositionChanged(MapCamera camera, bool hasGesture) {
    final previous = _zoom;
    _zoom = camera.zoom;
    final labelsChanged =
        (previous >= AppConstants.labelMinZoom) !=
        (_zoom >= AppConstants.labelMinZoom);
    final clustersChanged =
        (previous < AppConstants.markerClusterZoom) !=
        (_zoom < AppConstants.markerClusterZoom);
    if (labelsChanged || clustersChanged) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _syncOverlays();
        }
      });
    }
  }

  void _clampZoomForImagery(MapImagery imagery) {
    if (!_ready) {
      return;
    }
    final maxZoom = MapImageryStyle.forImagery(imagery).maxZoom.toDouble();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_ready) {
        return;
      }
      final camera = _mapController.camera;
      if (camera.zoom > maxZoom) {
        _mapController.move(camera.center, maxZoom);
      }
    });
  }

  void _zoomBy(double delta) {
    if (!_ready) {
      return;
    }
    final camera = _mapController.camera;
    final next = (camera.zoom + delta).clamp(3.0, _maxZoom).toDouble();
    _mapController.move(camera.center, next);
  }

  void _syncOverlays() {
    if (!mounted) {
      return;
    }
    final mapState = context.read<MapCubit>().state;
    final live = context.read<LiveTrackingCubit>().state;
    final trackers = context.read<TrackersCubit>().state;
    final tripState = context.read<TripHistoryCubit>().state;
    final drafts = buildTrackerMarkerDrafts(
      trackers: trackers.trackers,
      states: live.states,
      visibleIds: mapState.visibleTrackerIds,
    );
    final clusterMode =
        mapState.showLiveMarkers &&
        drafts.length >= AppConstants.markerClusterThreshold &&
        _zoom < AppConstants.markerClusterZoom;
    final showLabels =
        !clusterMode &&
        mapState.showLiveMarkers &&
        _zoom >= AppConstants.labelMinZoom &&
        drafts.length <= 150;

    final signature = StringBuffer()
      ..write(mapState.showLiveMarkers)
      ..write('|')
      ..write(mapState.showTripRoute)
      ..write('|')
      ..write(mapState.selectedTrackerId)
      ..write('|')
      ..write(clusterMode)
      ..write('|')
      ..write(showLabels)
      ..write('|')
      ..write(tripState.selectedTripIndex)
      ..write('|')
      ..write(tripState.playbackIndex)
      ..write('|')
      ..write(tripState.playbackStatus.name);
    for (final draft in drafts) {
      signature
        ..write('|')
        ..write(draft.id)
        ..write(':')
        ..write(draft.latitude.toStringAsFixed(5))
        ..write(':')
        ..write(draft.longitude.toStringAsFixed(5))
        ..write(':')
        ..write(draft.heading.round())
        ..write(':')
        ..write(draft.tone.name)
        ..write(':')
        ..write(draft.label);
    }
    final trip = tripState.selectedTrip;
    if (trip != null && mapState.showTripRoute) {
      signature
        ..write('|trip:')
        ..write(trip.pointsList.length);
    }
    final nextSignature = signature.toString();
    if (nextSignature == _signature) {
      return;
    }

    final markers = <Marker>[];
    if (mapState.showLiveMarkers) {
      if (clusterMode) {
        final clusters = clusterMarkerDrafts(drafts);
        final byId = {for (final draft in drafts) draft.id: draft};
        for (final cluster in clusters) {
          if (cluster.trackerIds.length == 1) {
            final draft = byId[cluster.trackerIds.first];
            if (draft != null) {
              markers.add(
                _vehicleMarker(
                  draft,
                  selectedId: mapState.selectedTrackerId,
                  showLabel: false,
                ),
              );
            }
          } else {
            markers.add(_clusterMarker(cluster));
          }
        }
      } else {
        for (final draft in drafts) {
          markers.add(
            _vehicleMarker(
              draft,
              selectedId: mapState.selectedTrackerId,
              showLabel: showLabels,
            ),
          );
        }
      }
    }

    final polylines = <Polyline>[];
    if (mapState.showTripRoute && trip != null) {
      final points = routePointsFor(trip);
      if (points.length >= 2) {
        final route = [
          for (final point in points) LatLng(point.lat, point.lng),
        ];
        polylines.add(
          Polyline(points: route, color: AppColors.accent, strokeWidth: 7),
        );
        polylines.add(
          Polyline(points: route, color: AppColors.primary, strokeWidth: 3.5),
        );
      }
      if (points.isNotEmpty) {
        markers.add(_endpointMarker(points.first, 'ب', AppColors.accent));
        markers.add(_endpointMarker(points.last, 'ن', AppColors.primary));
      }
      final playbackPoints = trip.pointsList;
      final index = tripState.playbackIndex;
      final showPlayback =
          playbackPoints.isNotEmpty &&
          index >= 0 &&
          index < playbackPoints.length &&
          (tripState.playbackStatus != PlaybackStatus.idle || index > 0);
      if (showPlayback) {
        final point = playbackPoints[index];
        if (isValidCoordinate(point.lat, point.lng)) {
          markers.add(
            Marker(
              key: const ValueKey('playback'),
              point: LatLng(point.lat!, point.lng!),
              width: 42,
              height: 42,
              alignment: Alignment.center,
              child: VehicleMarkerIcon(
                tone: MarkerTone.online,
                heading: point.heading ?? 0,
                selected: true,
              ),
            ),
          );
        }
      }
    }

    setState(() {
      _markers = markers;
      _polylines = polylines;
      _signature = nextSignature;
    });
  }

  Marker _vehicleMarker(
    TrackerMarkerDraft draft, {
    required int? selectedId,
    required bool showLabel,
  }) {
    final selected = selectedId == draft.id;
    return Marker(
      key: ValueKey('tracker_${draft.id}_$showLabel'),
      point: LatLng(draft.latitude, draft.longitude),
      width: showLabel ? 150 : 42,
      height: showLabel ? 64 : 42,
      alignment: Alignment.center,
      child: Tooltip(
        message: draft.label,
        waitDuration: const Duration(milliseconds: 200),
        child: GestureDetector(
          onTap: () => context.read<TrackersCubit>().selectTracker(draft.id),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              VehicleMarkerIcon(
                tone: draft.tone,
                heading: draft.heading,
                selected: selected,
              ),
              if (showLabel)
                Flexible(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: 0.94),
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                      border: Border.all(
                        color: selected ? AppColors.accent : AppColors.line,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 1,
                      ),
                      child: Text(
                        draft.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.text,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Marker _clusterMarker(MarkerClusterDraft cluster) {
    final count = cluster.trackerIds.length;
    return Marker(
      key: ValueKey('cluster_${cluster.latitude}_${cluster.longitude}_$count'),
      point: LatLng(cluster.latitude, cluster.longitude),
      width: 44,
      height: 44,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          if (!_ready) {
            return;
          }
          _mapController.move(
            LatLng(cluster.latitude, cluster.longitude),
            (_zoom + 2).clamp(3, _maxZoom).toDouble(),
          );
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.accent, width: 2),
          ),
          child: Center(
            child: Text(
              count > 999 ? '999+' : '$count',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Marker _endpointMarker(RoutePoint point, String label, Color color) {
    return Marker(
      key: ValueKey('endpoint_$label'),
      point: LatLng(point.lat, point.lng),
      width: 28,
      height: 28,
      alignment: Alignment.center,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.white, width: 2),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  void _applyCamera(MapCubitState state) {
    if (!_ready) {
      _pendingCamera = state;
      return;
    }
    switch (state.cameraAction) {
      case CameraAction.none:
        return;
      case CameraAction.focusTracker:
        final gps = context.read<LiveTrackingCubit>().state.stateFor(
          state.focusTrackerId,
        );
        final latitude = gps?.gps?.location?.lat;
        final longitude = gps?.gps?.location?.lng;
        if (!isValidCoordinate(latitude, longitude)) {
          _notify('لا يوجد موقع صالح لهذا المتتبع.');
          return;
        }
        _mapController.move(
          LatLng(latitude!, longitude!),
          AppConstants.focusZoom,
        );
      case CameraAction.fitVisible:
        _fitPoints([
          for (final point in _visiblePoints()) LatLng(point.$1, point.$2),
        ]);
      case CameraAction.fitBounds:
        final north = state.north;
        final south = state.south;
        final east = state.east;
        final west = state.west;
        if (north == null || south == null || east == null || west == null) {
          return;
        }
        _fitPoints([LatLng(south, west), LatLng(north, east)]);
    }
  }

  List<(double, double)> _visiblePoints() {
    final drafts = buildTrackerMarkerDrafts(
      trackers: context.read<TrackersCubit>().state.trackers,
      states: context.read<LiveTrackingCubit>().state.states,
      visibleIds: context.read<MapCubit>().state.visibleTrackerIds,
    );
    return [for (final draft in drafts) (draft.latitude, draft.longitude)];
  }

  void _fitPoints(List<LatLng> points) {
    if (!_ready || points.isEmpty) {
      if (points.isEmpty) {
        _notify('لا توجد متتبعات ظاهرة بموقع صالح.');
      }
      return;
    }
    if (points.length == 1) {
      _mapController.move(points.first, AppConstants.focusZoom);
      return;
    }
    _mapController.fitCamera(
      CameraFit.bounds(
        bounds: LatLngBounds.fromPoints(points),
        padding: const EdgeInsets.all(64),
        maxZoom: AppConstants.focusZoom,
      ),
    );
  }

  void _notify(String message) {
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}

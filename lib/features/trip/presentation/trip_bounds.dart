import 'dart:math' as math;

import '../../../core/utils/coordinate_utils.dart';
import '../data/models/trip_model.dart';

typedef RoutePoint = ({double lat, double lng});

GeoBounds? boundsForTrip(Trip trip) {
  final northwest = trip.bounds?.nw;
  final southeast = trip.bounds?.se;
  if (isValidCoordinate(northwest?.lat, northwest?.lng) &&
      isValidCoordinate(southeast?.lat, southeast?.lng)) {
    return GeoBounds(
      north: math.max(northwest!.lat!, southeast!.lat!),
      south: math.min(northwest.lat!, southeast.lat!),
      east: math.max(northwest.lng!, southeast.lng!),
      west: math.min(northwest.lng!, southeast.lng!),
    );
  }

  return GeoBounds.fromPoints(
    trip.pointsList.map(
      (point) => (lat: point.lat ?? double.nan, lng: point.lng ?? double.nan),
    ),
  );
}

List<RoutePoint> routePointsFor(Trip trip) {
  final points = <RoutePoint>[];
  for (final point in trip.pointsList) {
    if (isValidCoordinate(point.lat, point.lng)) {
      points.add((lat: point.lat!, lng: point.lng!));
    }
  }
  return points;
}

import 'dart:math' as math;

/// Returns false for null, NaN, infinite, or out-of-range coordinates.
///
/// (0, 0) is treated as a valid coordinate. It is a real location, and the
/// API sample does not define another sentinel.
bool isValidCoordinate(double? latitude, double? longitude) {
  if (latitude == null || longitude == null) {
    return false;
  }
  if (latitude.isNaN ||
      longitude.isNaN ||
      latitude.isInfinite ||
      longitude.isInfinite) {
    return false;
  }
  if (latitude < -90 || latitude > 90) {
    return false;
  }
  if (longitude < -180 || longitude > 180) {
    return false;
  }
  return true;
}

/// Snaps a heading into a small bucket so generated icons can be reused.
int headingBucket(num? heading, {int step = 5}) {
  if (heading == null || step <= 0) {
    return 0;
  }
  final normalized = heading.toDouble() % 360;
  final positive = normalized < 0 ? normalized + 360 : normalized;
  return (positive / step).round() * step % 360;
}

String cardinalDirection(num heading) {
  const directions = <String>[
    'شمال',
    'شمال شرقي',
    'شرق',
    'جنوب شرقي',
    'جنوب',
    'جنوب غربي',
    'غرب',
    'شمال غربي',
  ];
  final normalized = heading.toDouble() % 360;
  final positive = normalized < 0 ? normalized + 360 : normalized;
  final index = (positive / 45).round() % 8;
  return directions[index];
}

class GeoBounds {
  const GeoBounds({
    required this.north,
    required this.south,
    required this.east,
    required this.west,
  });

  final double north;
  final double south;
  final double east;
  final double west;

  bool get isValid =>
      north >= south &&
      east >= west &&
      isValidCoordinate(north, east) &&
      isValidCoordinate(south, west);

  static GeoBounds? fromPoints(Iterable<({double lat, double lng})> points) {
    double? north;
    double? south;
    double? east;
    double? west;
    for (final point in points) {
      if (!isValidCoordinate(point.lat, point.lng)) {
        continue;
      }
      north = north == null ? point.lat : math.max(north, point.lat);
      south = south == null ? point.lat : math.min(south, point.lat);
      east = east == null ? point.lng : math.max(east, point.lng);
      west = west == null ? point.lng : math.min(west, point.lng);
    }
    if (north == null || south == null || east == null || west == null) {
      return null;
    }
    return GeoBounds(north: north, south: south, east: east, west: west);
  }
}

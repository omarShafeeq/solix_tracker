import 'package:flutter_test/flutter_test.dart';
import 'package:map_yemen_tracker/core/utils/coordinate_utils.dart';

void main() {
  test('accepts coordinates inside the valid range', () {
    expect(isValidCoordinate(12.8956633, 44.9793599), isTrue);
    expect(isValidCoordinate(0, 0), isTrue);
    expect(isValidCoordinate(-90, -180), isTrue);
    expect(isValidCoordinate(90, 180), isTrue);
  });

  test('rejects null, NaN, and out-of-range coordinates', () {
    expect(isValidCoordinate(null, 44), isFalse);
    expect(isValidCoordinate(12, null), isFalse);
    expect(isValidCoordinate(double.nan, 44), isFalse);
    expect(isValidCoordinate(12, double.infinity), isFalse);
    expect(isValidCoordinate(90.1, 44), isFalse);
    expect(isValidCoordinate(12, 180.1), isFalse);
  });

  test('builds bounds only from valid points', () {
    final bounds = GeoBounds.fromPoints(const [
      (lat: double.nan, lng: 10),
      (lat: 12.0, lng: 44.0),
      (lat: 13.5, lng: 45.2),
    ]);

    expect(bounds?.south, 12);
    expect(bounds?.north, 13.5);
    expect(bounds?.west, 44);
    expect(bounds?.east, 45.2);
    expect(GeoBounds.fromPoints(const [(lat: 95, lng: 10)]), isNull);
  });
}

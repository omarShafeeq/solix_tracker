import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/json_converters.dart';

part 'trip_model.freezed.dart';
part 'trip_model.g.dart';

@freezed
abstract class TripPoint with _$TripPoint {
  const factory TripPoint({
    @FlexibleDoubleConverter() double? lat,
    @FlexibleDoubleConverter() double? lng,
    String? address,
    @FlexibleIntConverter() int? satellites,
    @FlexibleDoubleConverter() double? mileage,
    @FlexibleDoubleConverter() double? heading,
    @FlexibleDoubleConverter() double? speed,
    bool? buffered,
    @FlexibleDoubleConverter() double? alt,
    @JsonKey(name: 'get_time') String? getTime,
  }) = _TripPoint;

  factory TripPoint.fromJson(Map<String, dynamic> json) =>
      _$TripPointFromJson(json);
}

@freezed
abstract class TripLatLng with _$TripLatLng {
  const factory TripLatLng({
    @FlexibleDoubleConverter() double? lat,
    @FlexibleDoubleConverter() double? lng,
  }) = _TripLatLng;

  factory TripLatLng.fromJson(Map<String, dynamic> json) =>
      _$TripLatLngFromJson(json);
}

@freezed
abstract class TripBounds with _$TripBounds {
  const factory TripBounds({TripLatLng? nw, TripLatLng? se}) = _TripBounds;

  factory TripBounds.fromJson(Map<String, dynamic> json) =>
      _$TripBoundsFromJson(json);
}

@freezed
abstract class Trip with _$Trip {
  const factory Trip({
    @FlexibleIntConverter() int? id,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,
    @JsonKey(name: 'avg_speed') @FlexibleDoubleConverter() double? avgSpeed,
    @JsonKey(name: 'max_speed') @FlexibleDoubleConverter() double? maxSpeed,
    @FlexibleDoubleConverter() double? length,
    @JsonKey(name: 'end_address') String? endAddress,
    @JsonKey(name: 'start_address') String? startAddress,
    TripBounds? bounds,
    String? type,
    @FlexibleIntConverter() int? points,
    @JsonKey(
      name: 'points_list',
      fromJson: _pointsFromJson,
      toJson: _pointsToJson,
    )
    @Default(<TripPoint>[])
    List<TripPoint> pointsList,
  }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
}

List<TripPoint> _pointsFromJson(Object? json) {
  if (json is! List) {
    return const <TripPoint>[];
  }
  return json
      .whereType<Map<dynamic, dynamic>>()
      .map((item) => TripPoint.fromJson(Map<String, dynamic>.from(item)))
      .toList();
}

List<Map<String, dynamic>> _pointsToJson(List<TripPoint> points) {
  return points.map((point) => point.toJson()).toList();
}

@freezed
abstract class TripListResponse with _$TripListResponse {
  const factory TripListResponse({@Default(<Trip>[]) List<Trip> list}) =
      _TripListResponse;

  factory TripListResponse.fromJson(Map<String, dynamic> json) =>
      _$TripListResponseFromJson(json);
}

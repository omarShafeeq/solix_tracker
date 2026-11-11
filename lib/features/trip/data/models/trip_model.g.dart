// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TripPoint _$TripPointFromJson(Map<String, dynamic> json) => _TripPoint(
  lat: const FlexibleDoubleConverter().fromJson(json['lat']),
  lng: const FlexibleDoubleConverter().fromJson(json['lng']),
  address: json['address'] as String?,
  satellites: const FlexibleIntConverter().fromJson(json['satellites']),
  mileage: const FlexibleDoubleConverter().fromJson(json['mileage']),
  heading: const FlexibleDoubleConverter().fromJson(json['heading']),
  speed: const FlexibleDoubleConverter().fromJson(json['speed']),
  buffered: json['buffered'] as bool?,
  alt: const FlexibleDoubleConverter().fromJson(json['alt']),
  getTime: json['get_time'] as String?,
);

Map<String, dynamic> _$TripPointToJson(_TripPoint instance) =>
    <String, dynamic>{
      'lat': const FlexibleDoubleConverter().toJson(instance.lat),
      'lng': const FlexibleDoubleConverter().toJson(instance.lng),
      'address': instance.address,
      'satellites': const FlexibleIntConverter().toJson(instance.satellites),
      'mileage': const FlexibleDoubleConverter().toJson(instance.mileage),
      'heading': const FlexibleDoubleConverter().toJson(instance.heading),
      'speed': const FlexibleDoubleConverter().toJson(instance.speed),
      'buffered': instance.buffered,
      'alt': const FlexibleDoubleConverter().toJson(instance.alt),
      'get_time': instance.getTime,
    };

_TripLatLng _$TripLatLngFromJson(Map<String, dynamic> json) => _TripLatLng(
  lat: const FlexibleDoubleConverter().fromJson(json['lat']),
  lng: const FlexibleDoubleConverter().fromJson(json['lng']),
);

Map<String, dynamic> _$TripLatLngToJson(_TripLatLng instance) =>
    <String, dynamic>{
      'lat': const FlexibleDoubleConverter().toJson(instance.lat),
      'lng': const FlexibleDoubleConverter().toJson(instance.lng),
    };

_TripBounds _$TripBoundsFromJson(Map<String, dynamic> json) => _TripBounds(
  nw: json['nw'] == null
      ? null
      : TripLatLng.fromJson(json['nw'] as Map<String, dynamic>),
  se: json['se'] == null
      ? null
      : TripLatLng.fromJson(json['se'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TripBoundsToJson(_TripBounds instance) =>
    <String, dynamic>{'nw': instance.nw, 'se': instance.se};

_Trip _$TripFromJson(Map<String, dynamic> json) => _Trip(
  id: const FlexibleIntConverter().fromJson(json['id']),
  startDate: json['start_date'] as String?,
  endDate: json['end_date'] as String?,
  avgSpeed: const FlexibleDoubleConverter().fromJson(json['avg_speed']),
  maxSpeed: const FlexibleDoubleConverter().fromJson(json['max_speed']),
  length: const FlexibleDoubleConverter().fromJson(json['length']),
  endAddress: json['end_address'] as String?,
  startAddress: json['start_address'] as String?,
  bounds: json['bounds'] == null
      ? null
      : TripBounds.fromJson(json['bounds'] as Map<String, dynamic>),
  type: json['type'] as String?,
  points: const FlexibleIntConverter().fromJson(json['points']),
  pointsList: json['points_list'] == null
      ? const <TripPoint>[]
      : _pointsFromJson(json['points_list']),
);

Map<String, dynamic> _$TripToJson(_Trip instance) => <String, dynamic>{
  'id': const FlexibleIntConverter().toJson(instance.id),
  'start_date': instance.startDate,
  'end_date': instance.endDate,
  'avg_speed': const FlexibleDoubleConverter().toJson(instance.avgSpeed),
  'max_speed': const FlexibleDoubleConverter().toJson(instance.maxSpeed),
  'length': const FlexibleDoubleConverter().toJson(instance.length),
  'end_address': instance.endAddress,
  'start_address': instance.startAddress,
  'bounds': instance.bounds,
  'type': instance.type,
  'points': const FlexibleIntConverter().toJson(instance.points),
  'points_list': _pointsToJson(instance.pointsList),
};

_TripListResponse _$TripListResponseFromJson(Map<String, dynamic> json) =>
    _TripListResponse(
      list:
          (json['list'] as List<dynamic>?)
              ?.map((e) => Trip.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Trip>[],
    );

Map<String, dynamic> _$TripListResponseToJson(_TripListResponse instance) =>
    <String, dynamic>{'list': instance.list};

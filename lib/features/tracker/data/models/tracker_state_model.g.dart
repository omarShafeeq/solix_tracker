// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GpsLocation _$GpsLocationFromJson(Map<String, dynamic> json) => _GpsLocation(
  lat: const FlexibleDoubleConverter().fromJson(json['lat']),
  lng: const FlexibleDoubleConverter().fromJson(json['lng']),
);

Map<String, dynamic> _$GpsLocationToJson(_GpsLocation instance) =>
    <String, dynamic>{
      'lat': const FlexibleDoubleConverter().toJson(instance.lat),
      'lng': const FlexibleDoubleConverter().toJson(instance.lng),
    };

_GpsData _$GpsDataFromJson(Map<String, dynamic> json) => _GpsData(
  updated: json['updated'] as String?,
  signalLevel: const FlexibleIntConverter().fromJson(json['signal_level']),
  location: json['location'] == null
      ? null
      : GpsLocation.fromJson(json['location'] as Map<String, dynamic>),
  heading: const FlexibleDoubleConverter().fromJson(json['heading']),
  speed: const FlexibleDoubleConverter().fromJson(json['speed']),
  alt: const FlexibleDoubleConverter().fromJson(json['alt']),
);

Map<String, dynamic> _$GpsDataToJson(_GpsData instance) => <String, dynamic>{
  'updated': instance.updated,
  'signal_level': const FlexibleIntConverter().toJson(instance.signalLevel),
  'location': instance.location,
  'heading': const FlexibleDoubleConverter().toJson(instance.heading),
  'speed': const FlexibleDoubleConverter().toJson(instance.speed),
  'alt': const FlexibleDoubleConverter().toJson(instance.alt),
};

_GsmData _$GsmDataFromJson(Map<String, dynamic> json) => _GsmData(
  updated: json['updated'] as String?,
  signalLevel: const FlexibleIntConverter().fromJson(json['signal_level']),
  networkName: json['network_name'] as String?,
  roaming: json['roaming'] as bool?,
);

Map<String, dynamic> _$GsmDataToJson(_GsmData instance) => <String, dynamic>{
  'updated': instance.updated,
  'signal_level': const FlexibleIntConverter().toJson(instance.signalLevel),
  'network_name': instance.networkName,
  'roaming': instance.roaming,
};

_AdditionalReading _$AdditionalReadingFromJson(Map<String, dynamic> json) =>
    _AdditionalReading(
      value: dynamicToString(json['value']),
      updated: json['updated'] as String?,
    );

Map<String, dynamic> _$AdditionalReadingToJson(_AdditionalReading instance) =>
    <String, dynamic>{'value': instance.value, 'updated': instance.updated};

_TrackerGpsState _$TrackerGpsStateFromJson(Map<String, dynamic> json) =>
    _TrackerGpsState(
      sourceId: const FlexibleIntConverter().fromJson(json['source_id']),
      gps: json['gps'] == null
          ? null
          : GpsData.fromJson(json['gps'] as Map<String, dynamic>),
      connectionStatus: json['connection_status'] as String?,
      movementStatus: json['movement_status'] as String?,
      movementStatusUpdate: json['movement_status_update'] as String?,
      ignition: json['ignition'] as bool?,
      ignitionUpdate: json['ignition_update'] as String?,
      inputs: json['inputs'] == null
          ? const <bool>[]
          : _boolListFromJson(json['inputs']),
      outputs: json['outputs'] == null
          ? const <bool>[]
          : _boolListFromJson(json['outputs']),
      lastUpdate: json['last_update'] as String?,
      gsm: json['gsm'] == null
          ? null
          : GsmData.fromJson(json['gsm'] as Map<String, dynamic>),
      batteryLevel: const FlexibleIntConverter().fromJson(
        json['battery_level'],
      ),
      batteryUpdate: json['battery_update'] as String?,
      additional: json['additional'] == null
          ? const <String, AdditionalReading>{}
          : _additionalFromJson(json['additional']),
      actualTrackUpdate: json['actual_track_update'] as String?,
    );

Map<String, dynamic> _$TrackerGpsStateToJson(
  _TrackerGpsState instance,
) => <String, dynamic>{
  'source_id': const FlexibleIntConverter().toJson(instance.sourceId),
  'gps': instance.gps,
  'connection_status': instance.connectionStatus,
  'movement_status': instance.movementStatus,
  'movement_status_update': instance.movementStatusUpdate,
  'ignition': instance.ignition,
  'ignition_update': instance.ignitionUpdate,
  'inputs': _boolListToJson(instance.inputs),
  'outputs': _boolListToJson(instance.outputs),
  'last_update': instance.lastUpdate,
  'gsm': instance.gsm,
  'battery_level': const FlexibleIntConverter().toJson(instance.batteryLevel),
  'battery_update': instance.batteryUpdate,
  'additional': _additionalToJson(instance.additional),
  'actual_track_update': instance.actualTrackUpdate,
};

_TrackerStatesResponse _$TrackerStatesResponseFromJson(
  Map<String, dynamic> json,
) => _TrackerStatesResponse(
  userTime: json['user_time'] as String?,
  states: json['states'] == null
      ? const <String, TrackerGpsState?>{}
      : _statesFromJson(json['states']),
  success: json['success'] as bool?,
);

Map<String, dynamic> _$TrackerStatesResponseToJson(
  _TrackerStatesResponse instance,
) => <String, dynamic>{
  'user_time': instance.userTime,
  'states': _statesToJson(instance.states),
  'success': instance.success,
};

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/json_converters.dart';

part 'tracker_state_model.freezed.dart';
part 'tracker_state_model.g.dart';

@freezed
abstract class GpsLocation with _$GpsLocation {
  const factory GpsLocation({
    @FlexibleDoubleConverter() double? lat,
    @FlexibleDoubleConverter() double? lng,
  }) = _GpsLocation;

  factory GpsLocation.fromJson(Map<String, dynamic> json) =>
      _$GpsLocationFromJson(json);
}

@freezed
abstract class GpsData with _$GpsData {
  const factory GpsData({
    String? updated,
    @JsonKey(name: 'signal_level') @FlexibleIntConverter() int? signalLevel,
    GpsLocation? location,
    @FlexibleDoubleConverter() double? heading,
    @FlexibleDoubleConverter() double? speed,
    @FlexibleDoubleConverter() double? alt,
  }) = _GpsData;

  factory GpsData.fromJson(Map<String, dynamic> json) =>
      _$GpsDataFromJson(json);
}

@freezed
abstract class GsmData with _$GsmData {
  const factory GsmData({
    String? updated,
    @JsonKey(name: 'signal_level') @FlexibleIntConverter() int? signalLevel,
    @JsonKey(name: 'network_name') String? networkName,
    bool? roaming,
  }) = _GsmData;

  factory GsmData.fromJson(Map<String, dynamic> json) =>
      _$GsmDataFromJson(json);
}

@freezed
abstract class AdditionalReading with _$AdditionalReading {
  const factory AdditionalReading({
    @JsonKey(fromJson: dynamicToString) String? value,
    String? updated,
  }) = _AdditionalReading;

  factory AdditionalReading.fromJson(Map<String, dynamic> json) =>
      _$AdditionalReadingFromJson(json);
}

@freezed
abstract class TrackerGpsState with _$TrackerGpsState {
  const factory TrackerGpsState({
    @JsonKey(name: 'source_id') @FlexibleIntConverter() int? sourceId,
    GpsData? gps,
    @JsonKey(name: 'connection_status') String? connectionStatus,
    @JsonKey(name: 'movement_status') String? movementStatus,
    @JsonKey(name: 'movement_status_update') String? movementStatusUpdate,
    bool? ignition,
    @JsonKey(name: 'ignition_update') String? ignitionUpdate,
    @JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson)
    @Default(<bool>[])
    List<bool> inputs,
    @JsonKey(fromJson: _boolListFromJson, toJson: _boolListToJson)
    @Default(<bool>[])
    List<bool> outputs,
    @JsonKey(name: 'last_update') String? lastUpdate,
    GsmData? gsm,
    @JsonKey(name: 'battery_level') @FlexibleIntConverter() int? batteryLevel,
    @JsonKey(name: 'battery_update') String? batteryUpdate,
    @JsonKey(fromJson: _additionalFromJson, toJson: _additionalToJson)
    @Default(<String, AdditionalReading>{})
    Map<String, AdditionalReading> additional,
    @JsonKey(name: 'actual_track_update') String? actualTrackUpdate,
  }) = _TrackerGpsState;

  factory TrackerGpsState.fromJson(Map<String, dynamic> json) =>
      _$TrackerGpsStateFromJson(json);
}

@freezed
abstract class TrackerStatesResponse with _$TrackerStatesResponse {
  const factory TrackerStatesResponse({
    @JsonKey(name: 'user_time') String? userTime,
    @JsonKey(fromJson: _statesFromJson, toJson: _statesToJson)
    @Default(<String, TrackerGpsState?>{})
    Map<String, TrackerGpsState?> states,
    bool? success,
  }) = _TrackerStatesResponse;

  factory TrackerStatesResponse.fromJson(Map<String, dynamic> json) =>
      _$TrackerStatesResponseFromJson(json);
}

List<bool> _boolListFromJson(Object? json) {
  if (json is! List) {
    return const <bool>[];
  }
  return json.map((item) => item == true).toList();
}

List<bool> _boolListToJson(List<bool> values) => values;

Map<String, AdditionalReading> _additionalFromJson(Object? json) {
  if (json is! Map) {
    return const <String, AdditionalReading>{};
  }
  final readings = <String, AdditionalReading>{};
  json.forEach((key, value) {
    if (value is Map) {
      readings[key.toString()] = AdditionalReading.fromJson(
        Map<String, dynamic>.from(value),
      );
    }
  });
  return readings;
}

Map<String, dynamic> _additionalToJson(
  Map<String, AdditionalReading> readings,
) {
  return readings.map((key, value) => MapEntry(key, value.toJson()));
}

Map<String, TrackerGpsState?> _statesFromJson(Object? json) {
  if (json is! Map) {
    return const <String, TrackerGpsState?>{};
  }
  final states = <String, TrackerGpsState?>{};
  json.forEach((key, value) {
    if (value == null) {
      states[key.toString()] = null;
      return;
    }
    if (value is Map) {
      states[key.toString()] = TrackerGpsState.fromJson(
        Map<String, dynamic>.from(value),
      );
    }
  });
  return states;
}

Map<String, dynamic> _statesToJson(Map<String, TrackerGpsState?> states) {
  return states.map((key, value) => MapEntry(key, value?.toJson()));
}

/// Parses dynamic state keys into tracker IDs. Non-numeric keys are ignored.
/// A null state is preserved so the UI can tell "no state" from "not requested".
Map<int, TrackerGpsState?> parseTrackerStateKeys(
  Map<String, TrackerGpsState?> states,
) {
  final parsed = <int, TrackerGpsState?>{};
  states.forEach((key, value) {
    final id = int.tryParse(key.trim());
    if (id != null) {
      parsed[id] = value;
    }
  });
  return parsed;
}

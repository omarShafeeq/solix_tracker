// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrackerReadResponse _$TrackerReadResponseFromJson(Map<String, dynamic> json) =>
    _TrackerReadResponse(
      value: json['value'] == null
          ? null
          : Tracker.fromJson(json['value'] as Map<String, dynamic>),
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$TrackerReadResponseToJson(
  _TrackerReadResponse instance,
) => <String, dynamic>{'value': instance.value, 'success': instance.success};

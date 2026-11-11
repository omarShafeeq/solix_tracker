// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TagBinding _$TagBindingFromJson(Map<String, dynamic> json) => _TagBinding(
  tagId: const FlexibleIntConverter().fromJson(json['tag_id']),
  ordinal: const FlexibleIntConverter().fromJson(json['ordinal']),
);

Map<String, dynamic> _$TagBindingToJson(_TagBinding instance) =>
    <String, dynamic>{
      'tag_id': const FlexibleIntConverter().toJson(instance.tagId),
      'ordinal': const FlexibleIntConverter().toJson(instance.ordinal),
    };

_TrackerSource _$TrackerSourceFromJson(Map<String, dynamic> json) =>
    _TrackerSource(
      statusListingId: const FlexibleIntConverter().fromJson(
        json['status_listing_id'],
      ),
      id: const FlexibleIntConverter().fromJson(json['id']),
      creationDate: json['creation_date'] as String?,
      blocked: json['blocked'] as bool?,
      deviceId: json['device_id'] as String?,
      tariffId: const FlexibleIntConverter().fromJson(json['tariff_id']),
      model: json['model'] as String?,
      tariffEndDate: json['tariff_end_date'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$TrackerSourceToJson(_TrackerSource instance) =>
    <String, dynamic>{
      'status_listing_id': const FlexibleIntConverter().toJson(
        instance.statusListingId,
      ),
      'id': const FlexibleIntConverter().toJson(instance.id),
      'creation_date': instance.creationDate,
      'blocked': instance.blocked,
      'device_id': instance.deviceId,
      'tariff_id': const FlexibleIntConverter().toJson(instance.tariffId),
      'model': instance.model,
      'tariff_end_date': instance.tariffEndDate,
      'phone': instance.phone,
    };

_Tracker _$TrackerFromJson(Map<String, dynamic> json) => _Tracker(
  id: const FlexibleIntConverter().fromJson(json['id']),
  label: json['label'] as String? ?? '',
  groupId: const FlexibleIntConverter().fromJson(json['group_id']),
  source: json['source'] == null
      ? null
      : TrackerSource.fromJson(json['source'] as Map<String, dynamic>),
  tagBindings: json['tag_bindings'] == null
      ? const <TagBinding>[]
      : _tagBindingsFromJson(json['tag_bindings']),
  clone: json['clone'] as bool? ?? false,
);

Map<String, dynamic> _$TrackerToJson(_Tracker instance) => <String, dynamic>{
  'id': const FlexibleIntConverter().toJson(instance.id),
  'label': instance.label,
  'group_id': const FlexibleIntConverter().toJson(instance.groupId),
  'source': instance.source,
  'tag_bindings': _tagBindingsToJson(instance.tagBindings),
  'clone': instance.clone,
};

_TrackerListResponse _$TrackerListResponseFromJson(Map<String, dynamic> json) =>
    _TrackerListResponse(
      list:
          (json['list'] as List<dynamic>?)
              ?.map((e) => Tracker.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Tracker>[],
    );

Map<String, dynamic> _$TrackerListResponseToJson(
  _TrackerListResponse instance,
) => <String, dynamic>{'list': instance.list};

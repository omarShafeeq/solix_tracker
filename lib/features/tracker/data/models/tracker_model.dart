import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/json_converters.dart';

part 'tracker_model.freezed.dart';
part 'tracker_model.g.dart';

@freezed
abstract class TagBinding with _$TagBinding {
  const factory TagBinding({
    @JsonKey(name: 'tag_id') @FlexibleIntConverter() int? tagId,
    @FlexibleIntConverter() int? ordinal,
  }) = _TagBinding;

  factory TagBinding.fromJson(Map<String, dynamic> json) =>
      _$TagBindingFromJson(json);
}

@freezed
abstract class TrackerSource with _$TrackerSource {
  const factory TrackerSource({
    @JsonKey(name: 'status_listing_id')
    @FlexibleIntConverter()
    int? statusListingId,
    @FlexibleIntConverter() int? id,
    @JsonKey(name: 'creation_date') String? creationDate,
    bool? blocked,
    @JsonKey(name: 'device_id') String? deviceId,
    @JsonKey(name: 'tariff_id') @FlexibleIntConverter() int? tariffId,
    String? model,
    @JsonKey(name: 'tariff_end_date') String? tariffEndDate,
    String? phone,
  }) = _TrackerSource;

  factory TrackerSource.fromJson(Map<String, dynamic> json) =>
      _$TrackerSourceFromJson(json);
}

@freezed
abstract class Tracker with _$Tracker {
  const factory Tracker({
    @FlexibleIntConverter() int? id,
    @Default('') String label,
    @JsonKey(name: 'group_id') @FlexibleIntConverter() int? groupId,
    TrackerSource? source,
    @JsonKey(
      name: 'tag_bindings',
      fromJson: _tagBindingsFromJson,
      toJson: _tagBindingsToJson,
    )
    @Default(<TagBinding>[])
    List<TagBinding> tagBindings,
    @Default(false) bool clone,
  }) = _Tracker;

  factory Tracker.fromJson(Map<String, dynamic> json) =>
      _$TrackerFromJson(json);
}

List<TagBinding> _tagBindingsFromJson(Object? json) {
  if (json is! List) {
    return const <TagBinding>[];
  }
  return json
      .whereType<Map<dynamic, dynamic>>()
      .map((item) => TagBinding.fromJson(Map<String, dynamic>.from(item)))
      .toList();
}

List<Map<String, dynamic>> _tagBindingsToJson(List<TagBinding> bindings) {
  return bindings.map((binding) => binding.toJson()).toList();
}

@freezed
abstract class TrackerListResponse with _$TrackerListResponse {
  const factory TrackerListResponse({
    @Default(<Tracker>[]) List<Tracker> list,
  }) = _TrackerListResponse;

  factory TrackerListResponse.fromJson(Map<String, dynamic> json) =>
      _$TrackerListResponseFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

import 'tracker_model.dart';

part 'tracker_detail_model.freezed.dart';
part 'tracker_detail_model.g.dart';

@freezed
abstract class TrackerReadResponse with _$TrackerReadResponse {
  const factory TrackerReadResponse({Tracker? value, bool? success}) =
      _TrackerReadResponse;

  factory TrackerReadResponse.fromJson(Map<String, dynamic> json) =>
      _$TrackerReadResponseFromJson(json);
}

import 'package:json_annotation/json_annotation.dart';

/// Accepts JSON numbers and numeric strings. The samples use integers for
/// fields such as speed and heading, but the schema is not strict.
class FlexibleDoubleConverter implements JsonConverter<double?, Object?> {
  const FlexibleDoubleConverter();

  @override
  double? fromJson(Object? json) {
    if (json == null) {
      return null;
    }
    if (json is num) {
      return json.toDouble();
    }
    if (json is String) {
      return double.tryParse(json.trim());
    }
    return null;
  }

  @override
  Object? toJson(double? object) => object;
}

class FlexibleIntConverter implements JsonConverter<int?, Object?> {
  const FlexibleIntConverter();

  @override
  int? fromJson(Object? json) {
    if (json == null) {
      return null;
    }
    if (json is int) {
      return json;
    }
    if (json is num) {
      return json.toInt();
    }
    if (json is String) {
      return int.tryParse(json.trim());
    }
    return null;
  }

  @override
  Object? toJson(int? object) => object;
}

String? dynamicToString(Object? value) => value?.toString();

Object? stringToDynamic(String? value) => value;

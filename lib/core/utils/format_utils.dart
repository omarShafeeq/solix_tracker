import 'package:intl/intl.dart';

import 'coordinate_utils.dart';

const String kNotAvailable = 'غير متوفر';

/// Speed unit is not documented by the API. Values are shown as km/h because
/// that is the usual unit for this class of GPS tracker.
String formatSpeed(num? speed) {
  if (speed == null) {
    return kNotAvailable;
  }
  final value = speed.toDouble();
  if (value.isNaN) {
    return kNotAvailable;
  }
  final text = value == value.roundToDouble()
      ? value.toStringAsFixed(0)
      : value.toStringAsFixed(1);
  return '$text كم/س';
}

/// Altitude is shown in meters, the usual GPS altitude unit.
String formatAltitude(num? altitude) {
  if (altitude == null || altitude.toDouble().isNaN) {
    return kNotAvailable;
  }
  final value = altitude.toDouble();
  final text = value == value.roundToDouble()
      ? value.toStringAsFixed(0)
      : value.toStringAsFixed(1);
  return '$text م';
}

String formatCoordinate(double? value) {
  if (value == null || value.isNaN) {
    return kNotAvailable;
  }
  return value.toStringAsFixed(6);
}

String formatHeading(num? heading) {
  if (heading == null || heading.toDouble().isNaN) {
    return kNotAvailable;
  }
  return '${heading.toStringAsFixed(0)}° ${cardinalDirection(heading)}';
}

String formatPercent(num? value) {
  if (value == null || value.toDouble().isNaN) {
    return kNotAvailable;
  }
  return '${value.toStringAsFixed(0)}%';
}

String formatText(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return kNotAvailable;
  }
  return trimmed;
}

String formatBoolStatus(
  bool? value, {
  String yes = 'تشغيل',
  String no = 'إيقاف',
}) {
  if (value == null) {
    return kNotAvailable;
  }
  return value ? yes : no;
}

String formatApiTimestamp(String? value) {
  return formatText(value);
}

String formatDuration(Duration? duration) {
  if (duration == null) {
    return kNotAvailable;
  }
  if (duration.isNegative) {
    return kNotAvailable;
  }
  final hours = duration.inHours;
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);
  if (hours > 0) {
    return '$hours س $minutes د';
  }
  if (minutes > 0) {
    return '$minutes د $seconds ث';
  }
  return '$seconds ث';
}

Duration? durationBetween(String? start, String? end) {
  final from = parseApiDate(start);
  final to = parseApiDate(end);
  if (from == null || to == null) {
    return null;
  }
  return to.difference(from);
}

/// API timestamps have no timezone. They are parsed as local clock values and
/// displayed unchanged so the UI does not shift them.
DateTime? parseApiDate(String? value) {
  if (value == null || value.trim().isEmpty) {
    return null;
  }
  final normalized = value.trim().replaceFirst(' ', 'T');
  return DateTime.tryParse(normalized);
}

String formatRequestDate(DateTime value) {
  return DateFormat('yyyy-MM-dd HH:mm:ss').format(value);
}

String formatSyncTime(DateTime? value) {
  if (value == null) {
    return 'لم تتم المزامنة بعد';
  }
  return DateFormat('HH:mm:ss').format(value);
}

String formatRelativeSync(DateTime? value, {DateTime? now}) {
  if (value == null) {
    return 'لم تتم المزامنة بعد';
  }
  final clock = now ?? DateTime.now();
  final difference = clock.difference(value);
  if (difference.isNegative || difference.inSeconds < 5) {
    return 'تم التحديث الآن';
  }
  if (difference.inSeconds < 60) {
    return 'تم التحديث منذ ${difference.inSeconds} ث';
  }
  if (difference.inMinutes < 60) {
    return 'تم التحديث منذ ${difference.inMinutes} د';
  }
  return 'تم التحديث ${DateFormat('HH:mm:ss').format(value)}';
}

/// Looks for a mileage-like reading inside the API `additional` map.
///
/// Live state has no dedicated mileage field. A value is shown only when the
/// service actually sends one under a known key.
String mileageFromAdditional(Map<String, String?>? additional) {
  if (additional == null || additional.isEmpty) {
    return kNotAvailable;
  }
  const keys = <String>{'mileage', 'odometer', 'can_mileage', 'total_mileage'};
  for (final entry in additional.entries) {
    if (!keys.contains(entry.key.toLowerCase())) {
      continue;
    }
    final value = entry.value?.trim();
    if (value != null && value.isNotEmpty) {
      return value;
    }
  }
  return kNotAvailable;
}

/// `length` has no documented unit. It is displayed as km.
String formatDistance(num? length) {
  if (length == null || length.toDouble().isNaN) {
    return kNotAvailable;
  }
  final value = length.toDouble();
  final text = value == value.roundToDouble()
      ? value.toStringAsFixed(0)
      : value.toStringAsFixed(2);
  return '$text كم';
}

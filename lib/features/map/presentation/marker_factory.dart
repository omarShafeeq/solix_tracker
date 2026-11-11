import '../../../core/utils/coordinate_utils.dart';
import '../../tracker/data/models/tracker_model.dart';
import '../../tracker/data/models/tracker_state_model.dart';

enum MarkerTone { online, parked, offline, blocked }

class TrackerMarkerDraft {
  const TrackerMarkerDraft({
    required this.id,
    required this.label,
    required this.latitude,
    required this.longitude,
    required this.heading,
    required this.tone,
  });

  final int id;
  final String label;
  final double latitude;
  final double longitude;
  final double heading;
  final MarkerTone tone;
}

class MarkerClusterDraft {
  const MarkerClusterDraft({
    required this.latitude,
    required this.longitude,
    required this.trackerIds,
  });

  final double latitude;
  final double longitude;
  final List<int> trackerIds;
}

MarkerTone toneForTracker({
  required bool blocked,
  required TrackerGpsState? state,
}) {
  if (blocked) {
    return MarkerTone.blocked;
  }
  final online = state?.connectionStatus?.toLowerCase() == 'active';
  if (!online) {
    return MarkerTone.offline;
  }
  if (state?.movementStatus?.toLowerCase() == 'parked') {
    return MarkerTone.parked;
  }
  return MarkerTone.online;
}

/// Builds marker data for trackers that are visible and have usable GPS.
/// Invalid or missing coordinates are omitted.
List<TrackerMarkerDraft> buildTrackerMarkerDrafts({
  required List<Tracker> trackers,
  required Map<int, TrackerGpsState?> states,
  required Set<int> visibleIds,
}) {
  final drafts = <TrackerMarkerDraft>[];
  for (final tracker in trackers) {
    final id = tracker.id;
    if (id == null || !visibleIds.contains(id)) {
      continue;
    }
    final gpsState = states[id];
    final latitude = gpsState?.gps?.location?.lat;
    final longitude = gpsState?.gps?.location?.lng;
    if (!isValidCoordinate(latitude, longitude)) {
      continue;
    }
    final label = tracker.label.trim().isEmpty
        ? 'متتبع $id'
        : tracker.label.trim();
    drafts.add(
      TrackerMarkerDraft(
        id: id,
        label: label,
        latitude: latitude!,
        longitude: longitude!,
        heading: gpsState?.gps?.heading ?? 0,
        tone: toneForTracker(
          blocked: tracker.source?.blocked == true,
          state: gpsState,
        ),
      ),
    );
  }
  return drafts;
}

/// Groups nearby markers into grid cells. Single-marker cells stay as
/// one-id clusters so the caller can render them as normal vehicles.
List<MarkerClusterDraft> clusterMarkerDrafts(
  List<TrackerMarkerDraft> markers, {
  double cellDegrees = 0.45,
}) {
  if (markers.isEmpty || cellDegrees <= 0) {
    return const <MarkerClusterDraft>[];
  }
  final groups = <String, List<TrackerMarkerDraft>>{};
  for (final marker in markers) {
    final latBucket = (marker.latitude / cellDegrees).round();
    final lngBucket = (marker.longitude / cellDegrees).round();
    groups
        .putIfAbsent('$latBucket:$lngBucket', () => <TrackerMarkerDraft>[])
        .add(marker);
  }

  return groups.values.map((group) {
    var latitude = 0.0;
    var longitude = 0.0;
    for (final marker in group) {
      latitude += marker.latitude;
      longitude += marker.longitude;
    }
    return MarkerClusterDraft(
      latitude: latitude / group.length,
      longitude: longitude / group.length,
      trackerIds: group.map((marker) => marker.id).toList(),
    );
  }).toList();
}

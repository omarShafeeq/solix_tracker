import 'package:map_yemen_tracker/features/tracker/data/models/tracker_model.dart';
import 'package:map_yemen_tracker/features/tracker/data/models/tracker_state_model.dart';
import 'package:map_yemen_tracker/features/tracker/domain/repositories/tracker_repository.dart';
import 'package:map_yemen_tracker/features/trip/data/models/trip_model.dart';

Tracker sampleTracker({
  int id = 450,
  String label = '365-admin',
  bool blocked = false,
  String model = 'telfmu130_fmc130',
  List<TagBinding> tags = const [TagBinding(tagId: 19793, ordinal: 1)],
}) {
  return Tracker(
    id: id,
    label: label,
    groupId: 135,
    clone: false,
    source: TrackerSource(
      id: 442,
      blocked: blocked,
      deviceId: '864275076915639',
      model: model,
      phone: '967722053286',
      creationDate: '2021-12-24',
      tariffId: 39,
      tariffEndDate: '2026-12-01',
    ),
    tagBindings: tags,
  );
}

TrackerGpsState sampleGpsState({
  String? connectionStatus = 'active',
  String? movementStatus = 'parked',
  double? latitude = 12.8956633,
  double? longitude = 44.9793599,
  double speed = 0,
  bool includeGps = true,
}) {
  return TrackerGpsState(
    sourceId: 448,
    connectionStatus: connectionStatus,
    movementStatus: movementStatus,
    movementStatusUpdate: '2026-10-28 09:41:01',
    ignition: false,
    lastUpdate: '2026-10-28 15:46:05',
    batteryLevel: 100,
    batteryUpdate: '2026-10-28 15:46:01',
    inputs: const [false, false, false, false],
    outputs: const [false, false, false],
    gsm: const GsmData(
      updated: '2026-10-28 15:46:01',
      signalLevel: 80,
      networkName: 'Sabaphone',
      roaming: false,
    ),
    gps: includeGps
        ? GpsData(
            updated: '2026-10-28 15:46:01',
            signalLevel: 100,
            heading: 141,
            speed: speed,
            alt: 25,
            location: GpsLocation(lat: latitude, lng: longitude),
          )
        : null,
  );
}

Trip sampleTrip() {
  return const Trip(
    id: 10102,
    startDate: '2026-09-02 01:50:09',
    endDate: '2026-09-02 02:09:54',
    avgSpeed: 3,
    maxSpeed: 16,
    length: 0.99,
    startAddress: 'لحج, م .تبن, طريق عدن-تعز',
    endAddress: 'لحج, م .تبن, طريق عدن-تعز, مسجد الشهداء',
    points: 44,
    type: 'regular',
    pointsList: [
      TripPoint(
        lat: 12.9424516,
        lng: 44.957855,
        address: 'لحج, م .تبن, طريق عدن-تعز',
        satellites: 16,
        mileage: 0,
        heading: 44,
        speed: 0,
        buffered: true,
        alt: 43,
        getTime: '2026-09-02 01:50:09',
      ),
      TripPoint(lat: 12.9411633, lng: 44.9610866, speed: 16),
    ],
    bounds: TripBounds(
      nw: TripLatLng(lat: 12.9429266, lng: 44.957855),
      se: TripLatLng(lat: 12.9411633, lng: 44.9610866),
    ),
  );
}

class FakeTrackerRepository implements TrackerRepository {
  FakeTrackerRepository({
    List<Tracker>? trackers,
    Map<int, TrackerGpsState?>? states,
    this.error,
  }) : trackers = trackers ?? [sampleTracker()],
       states = states ?? {450: sampleGpsState()};

  List<Tracker> trackers;
  Tracker? detail;
  Map<int, TrackerGpsState?> states;
  Object? error;
  int listCalls = 0;
  int detailCalls = 0;
  int stateCalls = 0;
  final List<List<int>> batches = [];

  @override
  Future<Tracker> fetchTrackerById(int trackerId) async {
    detailCalls++;
    if (error != null) {
      throw error!;
    }
    return detail ??
        trackers.firstWhere(
          (tracker) => tracker.id == trackerId,
          orElse: () => sampleTracker(id: trackerId),
        );
  }

  @override
  Future<List<Tracker>> fetchTrackers() async {
    listCalls++;
    if (error != null) {
      throw error!;
    }
    return trackers;
  }

  @override
  Future<TrackerStatesResult> fetchStates(List<int> trackerIds) async {
    stateCalls++;
    batches.add(List<int>.from(trackerIds));
    if (error != null) {
      throw error!;
    }
    return TrackerStatesResult(
      success: true,
      userTime: '2026-10-28 15:50:07',
      states: {for (final id in trackerIds) id: states[id]},
    );
  }
}

/// Runtime configuration supplied with `--dart-define`.
///
/// A `--dart-define=API_HASH=...` value replaces the built-in hash. An empty
/// define also replaces it, so launch arguments must omit `API_HASH` to use
/// the default below.
abstract final class AppConfig {
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://yapi.yementrack.com',
  );

  static const String apiHash = String.fromEnvironment(
    'API_HASH',
    defaultValue: '7e3b6edb8f8a93631dea34b305ecbcbb',
  );

  static const int refreshIntervalSeconds = int.fromEnvironment(
    'REFRESH_INTERVAL_SECONDS',
    defaultValue: 10,
  );

  /// Maximum tracker IDs sent in one `/tracker/get_states` request.
  ///
  /// The API limit is not documented. 100 is a conservative batch size and
  /// can be changed with `--dart-define=STATE_BATCH_SIZE=100`.
  static const int stateBatchSize = int.fromEnvironment(
    'STATE_BATCH_SIZE',
    defaultValue: 100,
  );

  /// Maximum GPS points requested for a trip.
  ///
  /// The sample request uses `point_limit: 10`, which is too small to draw a
  /// route. 1000 is sent instead so the map can show the path. Change this
  /// constant if the API enforces a lower cap.
  static const int tripPointLimit = int.fromEnvironment(
    'TRIP_POINT_LIMIT',
    defaultValue: 10,
  );

  /// Street raster tile template. The default is the public OpenStreetMap server.
  ///
  /// That server is for light use. A production deployment should point this
  /// at a provider that allows the expected traffic, and must keep the
  /// matching attribution visible. See https://operations.osmfoundation.org/policies/tiles/
  static const String mapTileUrl = String.fromEnvironment(
    'MAP_TILE_URL',
    defaultValue: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  );

  /// Credit shown while the street layer is active.
  static const String mapTileAttribution = String.fromEnvironment(
    'MAP_TILE_ATTRIBUTION',
    defaultValue: '© مساهمو OpenStreetMap',
  );

  /// Public OpenStreetMap tiles are published through zoom 19.
  static const int mapTileMaxZoom = int.fromEnvironment(
    'MAP_TILE_MAX_ZOOM',
    defaultValue: 19,
  );

  /// Satellite raster tile template.
  ///
  /// The default is the documented Esri World Imagery MapServer tile resource:
  /// `https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{level}/{row}/{column}`.
  /// Flutter map placeholders follow that order, so `{y}` is the row and `{x}`
  /// is the column. Replace this only with a template your imagery license
  /// allows, and set [satelliteTileAttribution] to that provider's credit.
  /// Terms: https://goto.arcgisonline.com/maps/World_Imagery
  static const String satelliteTileUrl = String.fromEnvironment(
    'SATELLITE_TILE_URL',
    defaultValue:
        'https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
  );

  /// Credit shown while the satellite layer is active.
  ///
  /// The default is the `copyrightText` published by the World Imagery
  /// MapServer. Esri also requires a visible "Powered by Esri" credit when
  /// this host is used.
  static const String satelliteTileAttribution = String.fromEnvironment(
    'SATELLITE_TILE_ATTRIBUTION',
    defaultValue:
        'Source: Esri, Vantor, Earthstar Geographics, and the GIS User Community',
  );

  /// World Imagery publishes levels 0–23. Level 19 is worldwide high resolution.
  /// Higher levels exist only in some areas and can be enabled explicitly.
  static const int satelliteTileMaxZoom = int.fromEnvironment(
    'SATELLITE_TILE_MAX_ZOOM',
    defaultValue: 19,
  );

  static String get normalizedBaseUrl {
    var url = apiBaseUrl.trim();
    while (url.endsWith('/')) {
      url = url.substring(0, url.length - 1);
    }
    return url;
  }

  static bool get hasApiHash => apiHash.trim().isNotEmpty;
}

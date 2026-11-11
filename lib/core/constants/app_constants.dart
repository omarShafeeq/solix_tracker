abstract final class AppConstants {
  static const double desktopListWidth = 350;
  static const double desktopDetailsWidth = 380;
  static const double desktopBreakpoint = 1200;
  static const double tabletBreakpoint = 800;
  static const Duration searchDebounce = Duration(milliseconds: 300);
  static const Duration requestTimeout = Duration(seconds: 30);
  static const int minRefreshIntervalSeconds = 5;
  static const int markerClusterThreshold = 200;
  static const double markerClusterZoom = 10;
  static const double labelMinZoom = 12;
  static const double focusZoom = 16;

  /// Heading is applied by rotating the marker widget, so icons are not
  /// regenerated for each heading change.
  static const int headingBucketDegrees = 5;
}

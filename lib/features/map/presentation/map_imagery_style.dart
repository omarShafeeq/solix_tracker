import '../../../core/config/app_config.dart';
import 'cubits/map_state.dart';

/// Tile template and credit for one basemap.
///
/// The map widget keeps its controller, markers, and polylines. Only this
/// description changes when the user switches layers.
class MapImageryStyle {
  const MapImageryStyle({
    required this.urlTemplate,
    required this.maxZoom,
    required this.attribution,
    this.attributionUrl,
    this.providerCreditUrl,
  });

  final String urlTemplate;
  final int maxZoom;
  final String attribution;
  final String? attributionUrl;

  /// Set when the tile host requires the "Powered by Esri" credit.
  final String? providerCreditUrl;

  static MapImageryStyle forImagery(MapImagery imagery) {
    return switch (imagery) {
      MapImagery.street => MapImageryStyle(
        urlTemplate: _template(AppConfig.mapTileUrl),
        maxZoom: AppConfig.mapTileMaxZoom,
        attribution: AppConfig.mapTileAttribution,
        attributionUrl: _openStreetMapAttributionUrl(AppConfig.mapTileUrl),
      ),
      MapImagery.satellite => _satellite(),
    };
  }

  static MapImageryStyle _satellite() {
    final url = _template(AppConfig.satelliteTileUrl);
    final esri = _isEsriHost(url);
    return MapImageryStyle(
      urlTemplate: url,
      maxZoom: AppConfig.satelliteTileMaxZoom,
      attribution: AppConfig.satelliteTileAttribution,
      attributionUrl: esri
          ? 'https://goto.arcgisonline.com/maps/World_Imagery'
          : null,
      providerCreditUrl: esri ? 'https://www.esri.com' : null,
    );
  }

  static String _template(String url) {
    assert(
      url.contains('{z}') && url.contains('{x}') && url.contains('{y}'),
      'Tile URL must include {z}, {x}, and {y} placeholders.',
    );
    return url;
  }

  static bool _isEsriHost(String urlTemplate) {
    final host = _hostOf(urlTemplate);
    return host.endsWith('arcgisonline.com') || host.endsWith('arcgis.com');
  }

  static String? _openStreetMapAttributionUrl(String urlTemplate) {
    final host = _hostOf(urlTemplate);
    if (host.endsWith('openstreetmap.org')) {
      return 'https://www.openstreetmap.org/copyright';
    }
    return null;
  }

  static String _hostOf(String urlTemplate) {
    final normalized = urlTemplate.replaceAll(RegExp(r'\{[xyz]\}'), '0');
    return Uri.tryParse(normalized)?.host.toLowerCase() ?? '';
  }
}

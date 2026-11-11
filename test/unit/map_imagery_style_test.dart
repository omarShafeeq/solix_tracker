import 'package:flutter_test/flutter_test.dart';
import 'package:map_yemen_tracker/core/config/app_config.dart';
import 'package:map_yemen_tracker/features/map/presentation/cubits/map_state.dart';
import 'package:map_yemen_tracker/features/map/presentation/map_imagery_style.dart';

void main() {
  test('street tiles use the configured OpenStreetMap template', () {
    final style = MapImageryStyle.forImagery(MapImagery.street);

    expect(style.urlTemplate, AppConfig.mapTileUrl);
    expect(style.urlTemplate, contains('{z}'));
    expect(style.urlTemplate, contains('{x}'));
    expect(style.urlTemplate, contains('{y}'));
    expect(
      style.urlTemplate.indexOf('{x}'),
      lessThan(style.urlTemplate.indexOf('{y}')),
    );
    expect(style.attribution, '© مساهمو OpenStreetMap');
    expect(style.attributionUrl, 'https://www.openstreetmap.org/copyright');
    expect(style.providerCreditUrl, isNull);
    expect(style.maxZoom, 19);
  });

  test('satellite tiles use the documented Esri World Imagery endpoint', () {
    final style = MapImageryStyle.forImagery(MapImagery.satellite);

    expect(
      style.urlTemplate,
      'https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
    );
    expect(
      style.urlTemplate.indexOf('{y}'),
      lessThan(style.urlTemplate.indexOf('{x}')),
    );
    expect(
      style.attribution,
      'Source: Esri, Vantor, Earthstar Geographics, and the GIS User Community',
    );
    expect(
      style.attributionUrl,
      'https://goto.arcgisonline.com/maps/World_Imagery',
    );
    expect(style.providerCreditUrl, 'https://www.esri.com');
    expect(style.maxZoom, 19);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:map_yemen_tracker/core/config/app_config.dart';

void main() {
  test('default API base URL points at the tracking service', () {
    expect(AppConfig.normalizedBaseUrl, 'https://yapi.yementrack.com');
    expect(AppConfig.apiHash, '7e3b6edb8f8a93631dea34b305ecbcbb');
  });
}

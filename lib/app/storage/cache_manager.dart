import 'package:dio/dio.dart';
import 'package:dio_http_cache_fix/dio_http_cache.dart';
import 'package:doggo_pedia/app/config/flavor.dart';

class CacheManager {
  CacheManager._();

  static final DioCacheManager dioCacheManager = DioCacheManager(
    CacheConfig(baseUrl: FlavorConfig.instance!.values.baseUrl),
  );

  static final Options fiveMinuteCache = buildCacheOptions(
    const Duration(minutes: 5),
    maxStale: const Duration(days: 7),
  );

  static final Options fifteenMinuteCache = buildCacheOptions(
    const Duration(minutes: 15),
    maxStale: const Duration(days: 7),
  );

  static final Options settingsCache = buildCacheOptions(
    const Duration(minutes: 15),
    maxStale: const Duration(days: 365),
  );
}

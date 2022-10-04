import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

abstract class HttpService {
  static String? hivePath;
  static Future initialise() async {
    final path = await getApplicationDocumentsDirectory();
    hivePath = path.path;
  }

  static final cacheOption = CacheOptions(
    // A default store is required for interceptor.
    store: HiveCacheStore(hivePath),

    // All subsequent fields are optional.

    // Default.
    policy: CachePolicy.forceCache,
    // Returns a cached response on error but for statuses 401 & 403.
    // Also allows to return a cached response on network errors (e.g. offline usage).
    // Defaults to [null].
    hitCacheOnErrorExcept: [401, 403],
    // Overrides any HTTP directive to delete entry past this duration.
    // Useful only when origin server has no cache config or custom behaviour is desired.
    // Defaults to [null].
    maxStale: const Duration(days: 7),
    // Default. Allows 3 cache sets and ease cleanup.
    priority: CachePriority.normal,
    // Default. Body and headers encryption with your own algorithm.
    cipher: null,
    // Default. Key builder to retrieve requests.
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    // Default. Allows to cache POST requests.
    // Overriding [keyBuilder] is strongly recommended when [true].
    allowPostMethod: false,
  );

  static final DioCacheInterceptor _cacheInterceptor =
      DioCacheInterceptor(options: cacheOption);
  static Dio http = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/v2',
      connectTimeout: 60000,
      receiveTimeout: 60000,
      queryParameters: {"apiKey": "351f924ffdf54020b003399fa1f5fbfb"}))
    ..interceptors.add(_cacheInterceptor);
}

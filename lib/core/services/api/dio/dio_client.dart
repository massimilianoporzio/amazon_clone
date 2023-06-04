import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';

import '../../../../app/logs/api_client_logger.dart';
import '../../../../app/resources/app_constants.dart';
import '../../../../app/tools/paths/app_paths.dart';

class DioClient with ApiClientLoggy {
  static Future<Dio> createDio({bool isMock = false}) async {
    final dio = Dio(BaseOptions());
    dio.interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: HiveCacheStore(AppPathProvider.path),
          //store: MemCacheStore(maxSize: 10485760, maxEntrySize: 1048576),
          policy: CachePolicy.refreshForceCache,
          keyBuilder: (request) {
            return request.uri.toString();
          },
          hitCacheOnErrorExcept: [],
          maxStale: const Duration(
            days: AppConsts.cacheDays,
          ),
          //increase number of days for loger cache
          priority: CachePriority.high,
          allowPostMethod: true,
        ),
      ),
    );
    //this is for avoiding certificates error cause by dio
    //https://issueexplorer.com/issue/flutterchina/dio/1285

    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    return Future.value(dio);
  }
}

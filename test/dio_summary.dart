// --------------- Dio -----------------------
// -------------------------------------------
// [1] Dio is a HTTP client for Flutter with many features.
// -------------------------------------------

//* Package Link :
//         - https://pub.dev/packages/dio

//* Installation :
//         - At Pubspec assist add:
//                   - dio
//         - At terminal :
//                   - flutter pub add dio

//* Usage :

// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';

class Usage {

  /// Set Base Options
  // Dio() has basic configurations, but you can set different options:
  void setOptions() {
    Dio dio1 = Dio();
    dio1.options.baseUrl = "base url";
  }
  void setOption2() {
    BaseOptions options = BaseOptions(
      baseUrl: "base url",
    );
    Dio dio2 = Dio(options);
  }

  /// Method Request
  //        - Future<Response> get(...)
  //        - Future<Response> getUrl(...)
  //        - Future<Response> post(...)
  //        - Future<Response> postUrl(...)
  //        - Future<Response> put(...)
  //        - Future<Response> putUrl(...)
  //        - Future<Response> delete(...)
  //        - Future<Response> deleteUrl(...)
  //        - Future<Response> head(...)
  //        - Future<Response> headUrl(...)
  //        - Future<Response> put(...)
  //        - Future<Response> putUrl(...)
  //        - Future<Response> path(...)
  //        - Future<Response> pathUrl(...)
  //        - Future<Response> download(...)
  //        - Future<Response> downloadUrl(...)
  //        - Future<Response> request(...)
  //        - Future<Response> requestUrl(...)
  //        - Future<Response> fetch(...)
}

//* Example :


class DioHelper {
  static late Dio _dio;

  static Future<void> init() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://animechan.vercel.app/api/",
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(milliseconds: 3600),
        receiveTimeout: const Duration(milliseconds: 3600),
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.get(
      url,
      queryParameters: query,
    );
  }
}



//* Related Package :
//         - dio_cookie_manager 
//                    — A cookie manager for Dio
//         - dio_http2_adapter  
//                    — A Dio HttpClientAdapter which support Http/2.0
//         - dio_smart_retry 
//                    — Flexible retry library for dio
//         - http_certificate_pinning 
//                    — Https Certificate pinning for Flutter
//         - curl_logger_dio_interceptor 
//                    — Dio HTTP cache interceptor with multiple stores respecting HTTP directives (or not)
//         - dio_http_cache 
//                    — A simple cache library for Dio like Rxcache in Android
//         - pretty_dio_logger 
//                    — Pretty Dio logger is a Dio interceptor that logs network calls in a pretty, easy-to-read format.
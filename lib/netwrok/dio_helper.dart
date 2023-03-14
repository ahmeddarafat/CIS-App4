import 'package:cis_app4/model/quote_model.dart';
import 'package:dio/dio.dart';

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

import 'package:dio/dio.dart';
import 'package:my_antrian/app/repository/local/app_session.dart';

import 'api_interceptor.dart';

class ApiConfig {
  final _defaultInterceptor = ApiInterceptor();
  final _session = AppSession();

  Future<BaseOptions> _options() async {
    return BaseOptions(
      baseUrl: await _session.sessionGetBaseUrl(),
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 5),
    );
  }

  Future<Response<dynamic>> postCase(String url, dynamic body) async {
    final dio = Dio(await _options());
    dio.interceptors.add(_defaultInterceptor);
    return await dio.post(url, data: body);
  }

  Future<Response<dynamic>> putCase(String url, dynamic body) async {
    final dio = Dio(await _options());
    dio.interceptors.add(_defaultInterceptor);
    return await dio.put(url, data: body);
  }

  Future<Response<dynamic>> getCase(String url, Map<String, dynamic>? params) async {
    final dio = Dio(await _options());
    dio.interceptors.add(_defaultInterceptor);
    return await dio.get(url, queryParameters: params);
  }
}

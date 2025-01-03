import 'package:dio/dio.dart';
import 'package:my_antrian/app/repository/remote/api.dart';
import 'package:my_antrian/app/repository/remote/api_config.dart';

class RepoAntrian {
  final ApiConfig _apiConfig;

  RepoAntrian({required ApiConfig apiConfig}) : _apiConfig = apiConfig;

  Future<Response<dynamic>> getAntrianDisplay() {
    return _apiConfig.getCase(epAntrianDisplay, null);
  }
}

import 'package:get_storage/get_storage.dart';

class AppSession {
  ///Keys of shared data
  ///*
  final _box = GetStorage();
  final _baseUrl = "base_url";

//BASE URL
  void sessionSetBaseUrl(String baseUrl) async {
    await _box.write(_baseUrl, baseUrl);
  }

  Future<String> sessionGetBaseUrl() async {
    return await _box.read(_baseUrl) ?? "";
  }

  void sessionClear() async {
    await _box.erase();
  }
}

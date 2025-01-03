import 'dart:async';

import 'package:get/get.dart';
import 'package:my_antrian/app/repository/local/app_session.dart';
import 'package:my_antrian/app/repository/repo_login.dart';

import '../app/utils/util_date_time.dart';

class CtrlAuth extends GetxController {
  final _repo = RepoLogin(appSession: AppSession());
  final isLoading = false.obs;
  final _utilDateTime = UtilDateTime();
  final currentTime = "".obs;
  final currentDate = "".obs;

  getCurrentDateTime() {
    Timer.periodic(const Duration(seconds: 1), (Timer t) {
      currentTime.value = _utilDateTime.currentTime();
      currentDate.value = _utilDateTime.currentDate();
    });
  }

  void setBaseUrl(String baseUrl) {
    isLoading.value = true;
    _repo.setBaseUrl(baseUrl);
    Future.delayed(const Duration(seconds: 1), () async {
      final url = await getBaseUrl();
      if (url.isNotEmpty) isLoading.value = false;
    });
  }

  Future<String> getBaseUrl() => _repo.getBaseUrl();

  void logout() => _repo.logout();
}

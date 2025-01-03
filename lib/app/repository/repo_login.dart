import 'package:my_antrian/app/repository/local/app_session.dart';

class RepoLogin {
  final AppSession _appSession;

  RepoLogin({required AppSession appSession}) : _appSession = appSession;

  void setBaseUrl(String baseUrl) => _appSession.sessionSetBaseUrl(baseUrl);

  Future<String> getBaseUrl() => _appSession.sessionGetBaseUrl();

  void logout() {
    Future.delayed(const Duration(seconds: 1), () {
      _appSession.sessionClear();
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_antrian/app/repository/local/app_session.dart';
import 'package:my_antrian/views/home/home_page.dart';
import 'package:my_antrian/views/login/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  late AppSession appSession;

  @override
  void initState() {
    super.initState();
    appSession = AppSession();
    Future.delayed(const Duration(seconds: 3), () async {
      final baseUrl = await appSession.sessionGetBaseUrl();
      if (baseUrl.isBlank == true) {
        Get.to(const LoginPage());
      } else {
        Get.to(const HomePage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 82),
          child: Image.asset(
            "assets/images/img_logo.png",
            scale: 2,
          ),
        ),
      ),
    );
  }
}

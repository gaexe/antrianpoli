import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_antrian/app/utils/util_strings.dart';
import 'package:my_antrian/controllers/ctrl_auth.dart';

import '../doctor/doctor_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> with TickerProviderStateMixin {
  late CtrlAuth ctrlAuth;
  var baseUrl = "";
  final formLogin = GlobalKey<FormState>();

  void signIn() {
    final isValid = formLogin.currentState?.validate();
    if (isValid != null && isValid) {
      ctrlAuth.setBaseUrl(baseUrl);
      Future.delayed(const Duration(seconds: 1), () async {
        final url = await ctrlAuth.getBaseUrl();
        if (url.isNotEmpty == true) Get.to(const DoctorPage());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    ctrlAuth = Get.put(CtrlAuth());
  }

  @override
  void dispose() {
    Get.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SizedBox(
            height: 640,
            width: 420,
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formLogin,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/img_logo_only.png", scale: 4),
                  Container(
                    margin: const EdgeInsets.only(top: 18, left: 18, right: 18),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            //initialValue: _authCtrl.loginPayload.value.userName,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 2.0,
                                ),
                              ),
                              hintText: 'Base URL http:// or https://',
                              labelText: 'Base URL http:// or https://',
                            ),
                            validator: (text) {
                              if (text?.contains("http://") == false && text?.contains("https://") == false) {
                                return msgInvalidBaseUrl;
                              } else if (text != null && text.substring(text.length - 1) == "/") {
                                return msgInvalidBaseUrl;
                              } else if (text == null) {
                                return msgNotEmpty;
                              } else if (text.length < 11) {
                                return msgMin11;
                              } else {
                                baseUrl = text;
                              }
                              return null;
                            },
                          ),
                        ),
                        const Divider(indent: 16, endIndent: 16, height: 32, thickness: 0.5),
                        Padding(
                          padding: const EdgeInsets.only(top: 42),
                          child: Obx(() {
                            return TextButton(
                              onPressed: () {
                                signIn();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Center(
                                  child: ctrlAuth.isLoading.value
                                      ? const SizedBox(
                                          height: 26,
                                          width: 26,
                                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
                                        )
                                      : const Text(
                                          'S I M P A N',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

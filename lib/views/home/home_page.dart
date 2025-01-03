import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:my_antrian/controllers/ctrl_antrian.dart';
import 'package:my_antrian/controllers/ctrl_auth.dart';
import 'package:my_antrian/views/home/components/card_antrian_loket.dart';
import 'package:my_antrian/views/login/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late CtrlAntrian ctrlAntrian;
  late CtrlAuth ctrlAuth;

  @override
  void initState() {
    super.initState();
    ctrlAuth = Get.put(CtrlAuth());
    ctrlAntrian = Get.put(CtrlAntrian());
    Future.delayed(const Duration(seconds: 2), () {
      ctrlAntrian.getAntrianDisplay().then((data) {
        if (data.responseResult == false && data.message?.isNotEmpty == true) {
          Get.snackbar(
            "Ops!",
            data.message?.join(", ") ?? "",
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      });
    });
    ctrlAuth.getCurrentDateTime();
    ctrlAntrian.runBeep();
    ctrlAntrian.listenAntrian();
  }

  @override
  void dispose() {
    super.dispose();
    ctrlAntrian.dispose();
    ctrlAuth.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final loket = ctrlAntrian.responseOnCall.value.antrianJenis;
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        body: AnimatedBackground(
          vsync: this,
          behaviour: RandomParticleBehaviour(
            options: const ParticleOptions(
              spawnMaxRadius: 60,
              spawnMinSpeed: 10,
              spawnMaxSpeed: 50,
              particleCount: 68,
              image: Image(
                image: AssetImage(
                  "assets/images/img_logo_only.png",
                ),
              ),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 82,
                width: double.infinity,
                padding: const EdgeInsets.only(right: 24, left: 24, bottom: 12),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    stops: [0, 0.5, 1],
                    colors: [
                      Color.fromARGB(255, 255, 255, 255),
                      Color.fromARGB(153, 3, 59, 159),
                      Color.fromARGB(255, 33, 110, 250),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Image.asset(
                        "assets/images/img_logo.png",
                        width: 182,
                      ),
                      onDoubleTap: () {
                        ctrlAuth.logout();
                        Future.delayed(const Duration(seconds: 2), () {
                          Get.to(const LoginPage());
                        });
                      },
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ctrlAntrian.antrianDisplay.value.data?.info?.title ?? "",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          ctrlAntrian.antrianDisplay.value.data?.info?.subtitle ?? "",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 170,
                      child: Row(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                ctrlAuth.currentTime.value,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                ctrlAuth.currentDate.value,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 24),
                          InkWell(
                            onTap: () {
                              ctrlAuth.logout();
                              Get.to(const LoginPage());
                            },
                            child: Image.asset(
                              "assets/images/img_setting.png",
                              color: Colors.white,
                              scale: 3.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 38,
                padding: const EdgeInsets.symmetric(vertical: 8),
                color: const Color.fromARGB(255, 33, 110, 250),
                child: Marquee(
                  text: 'Some sample text that takes some space.',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  blankSpace: 20.0,
                  velocity: 100.0,
                  pauseAfterRound: const Duration(seconds: 4),
                  startPadding: 10.0,
                  accelerationDuration: const Duration(seconds: 5),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: const Duration(milliseconds: 1),
                  decelerationCurve: Curves.easeOut,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 42),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(
                                color: const Color.fromARGB(210, 250, 250, 250),
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width / 2.2,
                                  height: MediaQuery.sizeOf(context).height / 2.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "KE - ${ctrlAntrian.responseOnCall.value.loket?.namaLoket}".replaceAll("null", "-"),
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: MediaQuery.sizeOf(context).height / 24),
                                      const Divider(height: 12, thickness: 1),
                                      Container(
                                        width: double.infinity,
                                        color: ctrlAntrian.isHighlight.value ? Colors.yellow : Colors.white,
                                        child: Column(
                                          children: [
                                            SizedBox(height: MediaQuery.sizeOf(context).height / 42),
                                            const Text(
                                              "Antrian Nomor",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                height: 1,
                                              ),
                                            ),
                                            Text(
                                              "${ctrlAntrian.responseOnCall.value.noAntrian}".replaceAll("null", "-"),
                                              style: const TextStyle(
                                                fontSize: 62,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: MediaQuery.sizeOf(context).height / 42),
                                          ],
                                        ),
                                      ),
                                      const Divider(height: 12, thickness: 1),
                                      SizedBox(height: MediaQuery.sizeOf(context).height / 24),
                                      Text(
                                        "Pendaftar ${loket?.jenisAntrian}".replaceAll("null", "-"),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Card(
                                color: Colors.white,
                                child: SizedBox(
                                  width: MediaQuery.sizeOf(context).width / 2.2,
                                  height: MediaQuery.sizeOf(context).height / 2.2,
                                  child: Video(controller: ctrlAntrian.ctrlVideo),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 42),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...?ctrlAntrian.antrianDisplay.value.data?.antrian?.reversed.toList().sublist(0, 4).map((data) {
                              final jenisAntrian = data.loket?.idAntrianJenis == 1 ? "Pendaftar Umum" : "Pendaftar BPJS";
                              return cardAntrianLoket(context, "${data.loket?.namaLoket}", "${data.noAntrian}", jenisAntrian);
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

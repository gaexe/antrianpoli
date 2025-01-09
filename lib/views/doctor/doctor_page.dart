import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:my_antrian/views/doctor/components/item_category.dart';
import 'package:my_antrian/views/doctor/components/item_dokter.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
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
        child: Center(
          child: Container(
            height: double.infinity,
            width: MediaQuery.sizeOf(context).width / 2,
            margin: const EdgeInsets.symmetric(vertical: 42),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
              border: Border.all(color: Colors.white.withOpacity(0.2), width: 2.5),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 24),
                      child: Text(
                        "Pilih Dokter untuk ditampilkan (max 4)",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1),
                              side: const BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          child: Text(
                            "LANJUTKAN",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                const Divider(thickness: 1, color: Colors.white),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: double.infinity,
                        width: (MediaQuery.sizeOf(context).width / 2) / 4.5,
                        child: ListView(
                          children: [
                            itemCategory(),
                            itemCategory(),
                            itemCategory(),
                            itemCategory(),
                            itemCategory(),
                          ],
                        ),
                      ),
                      const VerticalDivider(thickness: 1, color: Colors.white),
                      SizedBox(
                        height: double.infinity,
                        width: (MediaQuery.sizeOf(context).width / 2) / 1.5,
                        child: ListView(
                          children: [
                            itemDokter(),
                            itemDokter(),
                            itemDokter(),
                            itemDokter(),
                            itemDokter(),
                            itemDokter(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

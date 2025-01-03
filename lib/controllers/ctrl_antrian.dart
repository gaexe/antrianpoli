import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:my_antrian/app/repository/repo_antrian.dart';
import 'package:my_antrian/models/responses/response_antrian_display.dart';
import 'package:my_antrian/models/responses/response_antrian_on_call.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../app/repository/remote/api_config.dart';

class CtrlAntrian extends GetxController {
  final _repo = RepoAntrian(apiConfig: ApiConfig());
  final antrianDisplay = ResponseAntrianDisplay().obs;
  final isHighlight = false.obs;
  final socket = IO.io('https://apidevhis.satunapas.com');
  final responseOnCall = ResponseAntrianOnCall().obs;
  late FlutterTts flutterTts;
  Timer? _debouncer;
  late final player = Player();
  late final ctrlVideo = VideoController(player);

  @override
  void onInit() {
    super.onInit();
    socket.onConnect((_) {
      socket.emit('msg', 'connected with client');
    });
    flutterTts = FlutterTts();
    flutterTts.setLanguage("id");
  }

  @override
  void onClose() {
    super.onClose();
    _debouncer?.cancel();
    player.dispose();
  }

  void listenAntrian() async {
    socket.on('event-antrian', (data) {
      if (_debouncer?.isActive ?? false) _debouncer?.cancel();
      _debouncer = Timer(const Duration(seconds: 4), () {
        getAntrianDisplay();
        responseOnCall.value = ResponseAntrianOnCall.fromJson(data);
        final noAntrian = responseOnCall.value.noAntrian;
        final loket = "${responseOnCall.value.loket?.namaLoket}";
        final jenis = responseOnCall.value.antrianJenis?.jenisAntrian;
        flutterTts.speak("antrian nomor $noAntrian silakan datang ke $loket pendaftar $jenis");
        update();
      });
    });
  }

  Future<ResponseAntrianDisplay> getAntrianDisplay() async {
    try {
      final result = await _repo.getAntrianDisplay();
      final antrian = ResponseAntrianDisplay.fromJson(result.data);
      antrianDisplay.value = antrian;
      // Play a [Media] or [Playlist].
      if (antrian.data?.info?.videoUrl?.isNotEmpty == true && !player.state.playing) {
        player.open(Media('${antrian.data?.info?.videoUrl}'));
        player.setPlaylistMode(PlaylistMode.loop);
      }
      update();
      return antrian;
    } catch (e) {
      return ResponseAntrianDisplay(responseResult: false, message: ["$e"]);
    }
  }

  runBeep() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      isHighlight.value = !isHighlight.value;
    });
  }
}

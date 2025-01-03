import 'package:intl/intl.dart';

class UtilDateTime {
  String currentTime() {
    final now = DateTime.now();
    return DateFormat('kk:mm:ss').format(now);
  }

  String currentDate() {
    final now = DateTime.now();
    return DateFormat("EEE, d MMM ''yy").format(now);
  }
}

import 'package:intl/intl.dart';

class Endpoints {
  static const String reciters = "reciters?language=en";
  static const String radio = "radios?language=en";

  static String get date => DateFormat('dd-MM-yyyy').format(DateTime.now());

  static String get timer => "timingsByCity/$date?city=cairo&country=egypt";
}

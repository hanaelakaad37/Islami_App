import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static const String onBoardingKey = "onBoarding";

  static Future<void> saveOnBoarding() async {
    await prefs.setBool(onBoardingKey, true);
  }

  static bool isOnBoardingSeen() {
    return prefs.getBool(onBoardingKey) ?? false;
  }

  static Future<void> clear() async {
    await prefs.clear();
  }
}

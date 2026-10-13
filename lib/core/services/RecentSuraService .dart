import 'package:shared_preferences/shared_preferences.dart';

class RecentSuraService {
  static const String _key = 'recent_suras';
  static const int _maxRecentSuras = 6;

  static Future<void> saveSura(int suraNumber) async {
    final prefs = await SharedPreferences.getInstance();

    final recentSuras = prefs.getStringList(_key) ?? [];

    recentSuras.remove(suraNumber.toString());
    recentSuras.insert(0, suraNumber.toString());
    final updatedList = recentSuras.take(_maxRecentSuras).toList();
    await prefs.setStringList(_key, updatedList);
  }

  static Future<List<int>> getRecentSuras() async {
    final prefs = await SharedPreferences.getInstance();
    final recentSuras = prefs.getStringList(_key) ?? [];
    return recentSuras.map(int.parse).toList();
  }
}

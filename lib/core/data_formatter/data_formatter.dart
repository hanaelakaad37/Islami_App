import 'package:intl/intl.dart';
import 'package:islami/modules/layout/timer/domain/entities/timer_entity.dart';

class DataFormatter {
  static String formateGregorian(GregorianEntity gregorian) {
    final month = gregorian.month;

    return '${gregorian.day} ${month.substring(0, 3)},\n${gregorian.year}';
  }

  static String formateHijri(HijriEntity hijri) {
    final month = hijri.month;

    return '${hijri.day} ${month.substring(0, 3)},\n${hijri.year}';
  }

  static String formateTime(String time) {
    final cleanTime = time.split(' ').first;
    final dateTime = DateFormat('HH:mm').parse(cleanTime);

    return DateFormat('hh:mm \na').format(dateTime);
  }

  static Map<String, dynamic> sortPrayerTimes(
    Map<String, dynamic> prayerTimes,
  ) {
    final now = DateTime.now();

    final entries = prayerTimes.entries.map((entry) {
      final timeParts = entry.value.toString().split(':');

      final hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1].split(' ').first);

      var prayerDateTime = DateTime(now.year, now.month, now.day, hour, minute);

      if (!prayerDateTime.isAfter(now)) {
        prayerDateTime = prayerDateTime.add(const Duration(days: 1));
      }

      return MapEntry(entry.key, {
        "time": prayerDateTime,
        "originalString": entry.value,
      });
    }).toList();

    entries.sort(
      (player1, player2) =>
          player1.value["time"].compareTo(player2.value['time']),
    );

    return Map.fromEntries(
      entries.map((e) => MapEntry(e.key, e.value['originalString'])),
    );
  }

  static MapEntry<String, Duration>? getNextPray(
    Map<String, dynamic> prayerTimes,
  ) {
    final now = DateTime.now();
    MapEntry<String, Duration>? nextPrayer;

    prayerTimes.forEach((prayerName, prayerTimeString) {
      final timeParts = prayerTimeString.toString().split(':');

      final hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1].split(' ').first);

      var prayerDateTime = DateTime(now.year, now.month, now.day, hour, minute);

      if (!prayerDateTime.isAfter(now)) {
        prayerDateTime = prayerDateTime.add(const Duration(days: 1));
      }
      final remainingTime = prayerDateTime.difference(now);

      if (nextPrayer == null || remainingTime < nextPrayer!.value) {
        nextPrayer = MapEntry(prayerName, remainingTime);
      }
    });

    return nextPrayer;
  }
}

class PrayerTimesEntity {
  final TimingsEntity timings;
  final DateEntity date;

  PrayerTimesEntity({required this.timings, required this.date});
}

class TimingsEntity {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  TimingsEntity({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });
}

class DateEntity {
  final String readable;
  final GregorianEntity gregorian;
  final HijriEntity hijri;

  DateEntity({
    required this.readable,
    required this.gregorian,
    required this.hijri,
  });
}

class GregorianEntity {
  final String date;
  final String day;
  final String year;
  final String month;
  final String weekday;

  GregorianEntity({
    required this.date,
    required this.year,
    required this.month,
    required this.weekday,
    required this.day,
  });
}

class HijriEntity {
  final String day;
  final String date;
  final String year;
  final String month;
  final String weekday;

  HijriEntity({
    required this.day,
    required this.date,
    required this.year,
    required this.month,
    required this.weekday,
  });
}

import '../../domain/entities/timer_entity.dart';

class PrayerTimesModel extends PrayerTimesEntity {
  PrayerTimesModel({required super.timings, required super.date});

  factory PrayerTimesModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimesModel(
      timings: TimingsModel.fromJson(json['data']['timings']),
      date: DateModel.fromJson(json['data']['date']),
    );
  }
}

class TimingsModel extends TimingsEntity {
  TimingsModel({
    required super.fajr,
    required super.dhuhr,
    required super.asr,
    required super.maghrib,
    required super.isha,
  });

  factory TimingsModel.fromJson(Map<String, dynamic> json) {
    return TimingsModel(
      fajr: json['Fajr'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
    );
  }
}

class DateModel extends DateEntity {
  DateModel({
    required super.readable,
    required super.gregorian,
    required super.hijri,
  });

  factory DateModel.fromJson(Map<String, dynamic> json) {
    return DateModel(
      readable: json['readable'],
      gregorian: GregorianModel.fromJson(json['gregorian']),
      hijri: HijriModel.fromJson(json['hijri']),
    );
  }
}

class GregorianModel extends GregorianEntity {
  GregorianModel({
    required super.date,
    required super.year,
    required super.month,
    required super.weekday,
    required super.day,
  });

  factory GregorianModel.fromJson(Map<String, dynamic> json) {
    return GregorianModel(
      date: json['date'],
      year: json['year'],
      day: json['day'],
      month: json['month']['en'],
      weekday: json['weekday']['en'],
    );
  }
}

class HijriModel extends HijriEntity {
  HijriModel({
    required super.date,
    required super.year,
    required super.month,
    required super.weekday,
    required super.day,
  });

  factory HijriModel.fromJson(Map<String, dynamic> json) {
    return HijriModel(
      date: json['date'],
      year: json['year'],
      month: json['month']['en'],
      weekday: json['weekday']['en'],
      day: json['day'],
    );
  }
}

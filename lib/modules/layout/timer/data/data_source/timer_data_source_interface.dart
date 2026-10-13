import '../models/timer_model.dart';

abstract class TimerDataSourceInterface {
  Future<PrayerTimesModel> getPrayTime();
}

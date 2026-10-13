import 'package:islami/core/network/api_results.dart';

import '../entities/azkar_entity.dart';
import '../entities/timer_entity.dart';

abstract class TimerRepository {
  Future<ApiResults<PrayerTimesEntity>> getTime();

  Future<List<AzkarEntity>> getAzkar(String category);
}

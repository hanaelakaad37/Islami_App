import 'package:islami/core/network/api_results.dart';
import 'package:islami/modules/layout/timer/domain/entities/timer_entity.dart';
import 'package:islami/modules/layout/timer/domain/repository/timer_repository.dart';

class TimerUseCase {
  final TimerRepository _timerRepository;

  TimerUseCase(this._timerRepository);

  Future<ApiResults<PrayerTimesEntity>> call() async {
    return await _timerRepository.getTime();
  }
}

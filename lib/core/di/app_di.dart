import 'package:get_it/get_it.dart';
import 'package:islami/modules/layout/hadith/hadith_di/hadith_di.dart';
import 'package:islami/modules/layout/quran/quran_di/quran_di.dart';
import 'package:islami/modules/layout/timer/timer_di/timer_di.dart';

import '../../modules/layout/radio/radio_di/radio_di.dart';
import '../network/dio_api_client.dart';

var getIt = GetIt.instance;

class AppDi {
  static void init() {
    getIt.registerLazySingleton(() => DioApiClient());

    RadioDi.setUp();
    QuranDi.setUp();
    TimerDi.setUp();
    HadithDi.setUp();
  }
}

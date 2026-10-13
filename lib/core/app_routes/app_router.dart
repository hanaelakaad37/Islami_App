import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/app_routes/app_routes_name.dart';
import 'package:islami/modules/layout/hadith/presentation/pages/hadith.dart';
import 'package:islami/modules/layout/layoutView.dart';
import 'package:islami/modules/layout/quran/presentation/pages/quran.dart';
import 'package:islami/modules/layout/quran/presentation/pages/quran_details.dart';
import 'package:islami/modules/layout/radio/presenration/pages/radio.dart';
import 'package:islami/modules/layout/splash/splash.dart';
import 'package:islami/modules/layout/tasbeh/tasbeh.dart';
import 'package:islami/modules/layout/timer/presentation/pages/timer_view.dart';
import 'package:islami/modules/layout/timer/presentation/pages/widgets/azkar/evening_azkar.dart';
import 'package:islami/modules/layout/timer/presentation/pages/widgets/azkar/morning_azkar.dart';

import '../../modules/layout/onboarding/onboarding.dart';
import '../../modules/layout/timer/presentation/manager/timer_bloc.dart';
import '../di/app_di.dart';

abstract class AppRouter {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutesName.initial: (context) => const SplashView(),
    AppRoutesName.onboarding: (context) => const Onboarding(),
    AppRoutesName.layout: (context) => const LayoutView(),
    AppRoutesName.quran: (context) => const Quran(),
    AppRoutesName.hadith: (context) => const Hadith(),
    AppRoutesName.tasbeh: (context) => const Tasbeh(),
    AppRoutesName.radio: (context) => const RadioView(),
    AppRoutesName.timerView: (context) => BlocProvider(
      create: (_) => getIt<TimerBloc>()..add(GetPrayTimeEvent()),
      child: const TimerView(),
    ),
    AppRoutesName.quranDetails: (context) => const QuranDetails(),
    AppRoutesName.morningAzkar: (context) => const MorningAzkar(),
    AppRoutesName.eveningAzkar: (context) => const EveningAzkar(),
  };
}

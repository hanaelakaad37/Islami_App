import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/app_routes/app_routes_name.dart';
import 'package:islami/modules/layout/hadith/hadith.dart';
import 'package:islami/modules/layout/layoutView.dart';
import 'package:islami/modules/layout/quran/quran.dart';
import 'package:islami/modules/layout/quran/quran_details.dart';
import 'package:islami/modules/layout/radio/radio.dart';
import 'package:islami/modules/layout/splash/splash.dart';
import 'package:islami/modules/layout/tasbeh/tasbeh.dart';
import 'package:islami/modules/layout/timer/timer_view.dart';

import '../../modules/layout/onboarding/onboarding.dart';

abstract class AppRouter {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutesName.initial: (context) => const SplashView(),
    AppRoutesName.onboarding: (context) => const Onboarding(),
    AppRoutesName.layout: (context) => const LayoutView(),
    AppRoutesName.quran: (context) => const Quran(),
    AppRoutesName.hadith: (context) => const Hadith(),
    AppRoutesName.tasbeh: (context) => const Tasbeh(),
    AppRoutesName.radio: (context) => const RadioView(),
    AppRoutesName.timerView: (context) => const TimerView(),
    AppRoutesName.quranDetails: (context) => const QuranDetails(),
  };
}

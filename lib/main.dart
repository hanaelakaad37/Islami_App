import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_theme_manager.dart';

import 'core/app_routes/app_router.dart';
import 'core/app_routes/app_routes_name.dart';
import 'core/di/app_di.dart';
import 'core/services/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefService.init();
  AppDi.init();

  runApp(const Islami());
}

class Islami extends StatelessWidget {
  const Islami({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.getThemeData(),

      initialRoute: AppRoutesName.initial,
      routes: AppRouter.routes,
    );
  }
}

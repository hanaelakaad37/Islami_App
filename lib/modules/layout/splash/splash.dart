import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami/core/app_routes/app_routes_name.dart';
import 'package:islami/core/gen/assets.gen.dart';
import 'package:islami/core/theme/app_colors.dart';

import '../../../core/services/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  /// flutter life cycle
  @override
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        SharedPrefService.isOnBoardingSeen()
            ? AppRoutesName.layout
            : AppRoutesName.onboarding,
        (route) => false,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Assets.icons.objects.svg(
          colorFilter: const ColorFilter.mode(AppColors.gold, BlendMode.srcIn),
          width: 185.32,
          height: 165.2,
        ),
      ),
    );
  }
}

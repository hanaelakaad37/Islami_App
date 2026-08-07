import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';

abstract class AppThemeManager {
  static ThemeData getThemeData() => ThemeData(
    primaryColor: AppColors.gold,
    scaffoldBackgroundColor: AppColors.dark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.gold,
      selectedItemColor: AppColors.white,

      /// BottomNavigationBar
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontFamily: "Janna",
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.gold),
      titleTextStyle: TextStyle(
        fontFamily: "Janna",
        fontSize: 20,
        color: AppColors.gold,
        fontWeight: FontWeight.w700,
      ),
    ),

    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontFamily: "Janna",
        color: AppColors.dark,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        fontFamily: "Janna",
        fontSize: 20,
        color: AppColors.dark,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Janna",
        color: AppColors.offWhite,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Janna",
        color: AppColors.dark,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

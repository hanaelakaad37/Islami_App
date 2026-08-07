import 'package:flutter/material.dart';
import 'package:islami/core/gen/assets.gen.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/modules/layout/quran/quran.dart';
import 'package:islami/modules/layout/radio/radio.dart';
import 'package:islami/modules/layout/tasbeh/tasbeh.dart';
import 'package:islami/modules/layout/timer/timer_view.dart';

import 'hadith/hadith.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  final List<Widget> _pages = [
    Quran(),
    Hadith(),
    Tasbeh(),
    RadioView(),
    TimerView(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.dark.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(66),
              ),
              child: Assets.icons.quran.svg(height: 25),
            ),
            icon: Assets.icons.quran.svg(
              height: 25,
              colorFilter: ColorFilter.mode(AppColors.dark, BlendMode.srcIn),
            ),
            label: "Quran",
          ),

          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.dark.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(66),
              ),
              child: Assets.icons.hadith.svg(height: 25),
            ),
            icon: Assets.icons.hadith.svg(
              height: 25,
              colorFilter: ColorFilter.mode(AppColors.dark, BlendMode.srcIn),
            ),
            label: "Hadith",
          ),

          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.dark.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(66),
              ),
              child: Assets.icons.icSebha.svg(height: 25),
            ),
            icon: Assets.icons.icSebha.svg(
              height: 25,
              colorFilter: ColorFilter.mode(AppColors.dark, BlendMode.srcIn),
            ),
            label: "Tasbeh",
          ),

          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.dark.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(66),
              ),
              child: Assets.icons.icRadio.svg(height: 25),
            ),
            icon: Assets.icons.icRadio.svg(
              height: 25,
              colorFilter: ColorFilter.mode(AppColors.dark, BlendMode.srcIn),
            ),
            label: "Radio",
          ),

          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.dark.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(66),
              ),
              child: Assets.icons.icTime.svg(height: 25),
            ),
            icon: Assets.icons.icTime.svg(
              height: 25,
              colorFilter: ColorFilter.mode(AppColors.dark, BlendMode.srcIn),
            ),
            label: "Timer",
          ),
        ],
      ),
    );
  }
}

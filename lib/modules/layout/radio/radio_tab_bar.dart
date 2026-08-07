import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class RadioTabBar extends StatelessWidget {
  const RadioTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.circular(12),
      ),

      child: TabBar(
        indicator: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(12),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.white,
        tabs: const [
          Tab(text: "Radio"),
          Tab(text: "Reciters"),
        ],
      ),
    );
  }
}

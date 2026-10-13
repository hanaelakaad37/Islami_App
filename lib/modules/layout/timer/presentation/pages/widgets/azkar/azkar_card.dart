import 'package:flutter/material.dart';
import 'package:islami/modules/layout/timer/domain/entities/azkar_entity.dart';

import '../../../../../../../core/theme/app_colors.dart';

class AzkarCard extends StatelessWidget {
  final AzkarEntity zekr;

  const AzkarCard({super.key, required this.zekr});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.darkGold),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              zekr.content,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.offWhite,
                height: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

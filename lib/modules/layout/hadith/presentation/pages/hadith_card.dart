import 'package:flutter/material.dart';
import 'package:islami/modules/layout/hadith/domain/entities/hadith_entity.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/theme/app_colors.dart';
import 'hadith_background.dart';

class HadithCard extends StatelessWidget {
  final HadithEntity hadithEntity;

  const HadithCard({super.key, required this.hadithEntity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: Assets.images.hadithCardBackGround1.provider(),
        ),
      ),
      child: Stack(
        children: [
          const HadithBackground(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      hadithEntity.title,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    hadithEntity.content,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.dark,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

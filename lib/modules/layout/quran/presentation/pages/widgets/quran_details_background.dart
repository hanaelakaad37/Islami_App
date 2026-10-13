import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/modules/layout/quran/domain/entities/quran_entity.dart';

import '../../../../../../core/gen/assets.gen.dart';

class QuranDetailsBackground extends StatelessWidget {
  final SuraEntity suraEntity;

  const QuranDetailsBackground({super.key, required this.suraEntity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Assets.images.imgLeftCorner.image(width: 90, height: 90),
              Text(
                suraEntity.suraNameAr,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: AppColors.gold,
                ),
              ),
              Assets.images.imgRightCorner.image(width: 90, height: 90),
            ],
          ),
          const Spacer(),
          Assets.images.imgBottomDecoration.image(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/model/sura_data_model.dart';

import '../../../../core/gen/assets.gen.dart';

class QuranDetailsBackground extends StatelessWidget {
  final SuraDataModel suraDataModel;

  const QuranDetailsBackground({super.key, required this.suraDataModel});

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
                suraDataModel.suraNameAr,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: AppColors.gold,
                ),
              ),
              Assets.images.imgRightCorner.image(width: 90, height: 90),
            ],
          ),
          Spacer(),
          Assets.images.imgBottomDecoration.image(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/theme/app_colors.dart';

class HadithBackground extends StatelessWidget {
  const HadithBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Assets.images.hadithLeftCorner.image(width: 80, height: 80),
              Assets.images.hadithRightCorner.image(width: 80, height: 80),
            ],
          ),

          Spacer(),
          Assets.images.imgBottomDecoration.image(color: AppColors.dark),
        ],
      ),
    );
  }
}

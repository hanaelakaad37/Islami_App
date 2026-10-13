import 'package:flutter/material.dart';
import 'package:islami/modules/layout/quran/domain/entities/quran_entity.dart';

import '../../../../../../core/gen/assets.gen.dart';
import '../../../../../../core/theme/app_colors.dart';

class SuraItem extends StatelessWidget {
  final SuraEntity suraEntity;
  final VoidCallback? onTap;

  const SuraItem({
    super.key,
    required this.suraEntity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(image: Assets.images.vector.provider()),
            ),
            child: Text(
              "${suraEntity.suraNumber}",
              style: textTheme.bodyLarge,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(suraEntity.suraNameEn, style: textTheme.bodyLarge),
              Text(
                "${suraEntity.versesCount} Verses",
                style: textTheme.bodyMedium?.copyWith(color: AppColors.white),
              ),
            ],
          ),
          const Spacer(),
          Text(suraEntity.suraNameAr, style: textTheme.bodyLarge),
        ],
      ),
    );
  }
}

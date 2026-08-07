import 'package:flutter/material.dart';
import 'package:islami/model/hadith_data_model.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../core/theme/app_colors.dart';
import 'hadith_background.dart';

class HadithCard extends StatefulWidget {
  final HadithDataModel hadithDataModel;

  const HadithCard({super.key, required this.hadithDataModel});

  @override
  State<HadithCard> createState() => _HadithCardState();
}

class _HadithCardState extends State<HadithCard> {
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
          HadithBackground(),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Center(
                    child: Text(
                      widget.hadithDataModel.hadithTitle,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),

                  Text(
                    widget.hadithDataModel.hadithContent,
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

import 'package:flutter/material.dart';
import 'package:islami/modules/layout/tasbeh/tasbeh_text.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../core/theme/app_colors.dart';

class Tasbeh extends StatefulWidget {
  const Tasbeh({super.key});

  @override
  State<Tasbeh> createState() => _TasbehState();
}

class _TasbehState extends State<Tasbeh> {
  double angle = 0;
  int count = 0;

  int zkerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Positioned.fill(child: Assets.images.sebhaBg.image(fit: BoxFit.cover)),
        Container(color: AppColors.dark.withValues(alpha: 0.7)),

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Assets.images.islami.image(width: 291, height: 171),
                ),
                SizedBox(height: 16),
                Text(
                  TasbehText.title,
                  style: theme.textTheme.bodyLarge?.copyWith(fontSize: 36),
                ),
                SizedBox(height: 16),
                Positioned(
                  top: 5,
                  child: Assets.images.maskGroup.image(width: 70, height: 70),
                ),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      angle += 0.32;

                      count++;
                      if (count > 33) {
                        count = 0;
                        zkerIndex++;
                      }

                      if (zkerIndex == TasbehText.zker.length) {
                        zkerIndex = 0;
                      }
                    });
                  },

                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.rotate(
                        angle: angle,
                        child: Assets.images.sebhaBody.image(),
                      ),
                      Column(
                        children: [
                          Text(
                            TasbehText.zker[zkerIndex],
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontSize: 32,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "$count",
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontSize: 36,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

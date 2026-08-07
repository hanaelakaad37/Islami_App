import 'package:flutter/material.dart';
import 'package:islami/core/theme/app_colors.dart';

import '../../../core/gen/assets.gen.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  bool isPause = false;
  bool volume = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          height: 133,
          decoration: BoxDecoration(
            color: AppColors.gold,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: index % 2 == 0
                    ? Assets.images.imgBottomDecoration.image(
                        color: AppColors.dark.withValues(alpha: 0.3),
                      )
                    : Assets.images.soundWave11.image(
                        color: AppColors.dark.withValues(alpha: 0.3),
                      ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Radio Ibrahim Al-Akdar",
                        style: theme.textTheme.titleLarge,
                      ),
                      SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isPause = !isPause;
                              });
                            },
                            child: isPause
                                ? Assets.icons.polygon.svg()
                                : Assets.icons.pause.svg(),
                          ),
                          SizedBox(width: 32),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                volume = !volume;
                              });
                            },
                            child: volume
                                ? Assets.icons.volumeHigh.svg()
                                : Assets.icons.volumeCross.svg(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 16);
      },
      itemCount: 5,
    );
  }
}

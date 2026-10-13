import 'package:flutter/material.dart';
import 'package:islami/core/app_routes/app_routes_name.dart';
import 'package:islami/modules/layout/timer/presentation/pages/widgets/timer/pray_time.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/theme/app_colors.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Positioned.fill(child: Assets.images.timerBg.image(fit: BoxFit.cover)),

        Container(color: AppColors.dark.withValues(alpha: 0.7)),

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Assets.images.islami.image(width: 291, height: 171),
                  ),

                  const PrayTime(),

                  const SizedBox(height: 16),

                  Text('Azkar', style: theme.textTheme.bodyLarge),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutesName.morningAzkar,
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                            color: AppColors.dark,
                            border: Border.all(color: AppColors.gold, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Assets.images.morningAzkar.image(),
                              Text(
                                'Morning Azkar',
                                style: theme.textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutesName.eveningAzkar,
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.43,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                            color: AppColors.dark,
                            border: Border.all(color: AppColors.gold, width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Assets.images.eveningAzkar.image(),
                              Text(
                                'Evening Azkar',
                                style: theme.textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

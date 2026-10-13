import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/gen/assets.gen.dart';
import 'package:islami/core/theme/app_colors.dart';

import '../../../../../../../core/data_formatter/data_formatter.dart';
import '../../../manager/timer_bloc.dart';
import 'next_prayer_widget.dart';

class PrayTime extends StatelessWidget {
  const PrayTime({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.31,
      decoration: BoxDecoration(
        color: AppColors.darkGold,
        borderRadius: BorderRadius.circular(40),
        image: DecorationImage(
          image: Assets.images.prayTime.provider(),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocBuilder<TimerBloc, TimerState>(
        builder: (context, state) {
          if (state is TimerInitial || state is TimerLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.gold),
            );
          }

          if (state is TimerError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
            );
          }

          if (state is TimerSuccess) {
            final prayerTimes = state.prayerTimes;
            final date = prayerTimes.date;
            final timings = prayerTimes.timings;

            final prayerTimesMap = {
              'FAJR': timings.fajr,
              'DHUHR': timings.dhuhr,
              'ASR': timings.asr,
              'MAGHRIB': timings.maghrib,
              'ISHA': timings.isha,
            };

            final sortedPrayerTimes = DataFormatter.sortPrayerTimes(
              prayerTimesMap,
            );

            final prayers = sortedPrayerTimes.entries.map((entry) {
              return {'name': entry.key, 'time': entry.value};
            }).toList();

            return Padding(
              padding: const EdgeInsets.all(8),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DataFormatter.formateGregorian(date.gregorian),
                          style: theme.textTheme.bodyLarge,
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Pray Time',
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: AppColors.dark,
                              ),
                            ),
                            Text(
                              date.gregorian.weekday,
                              style: theme.textTheme.titleLarge?.copyWith(
                                color: AppColors.dark,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          DataFormatter.formateHijri(date.hijri),
                          textAlign: TextAlign.end,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    top: 48,
                    left: 0,
                    right: 0,
                    bottom: 35,
                    child: CarouselSlider.builder(
                      itemCount: prayers.length,
                      itemBuilder: (context, index, realIndex) {
                        final prayer = prayers[index];

                        return Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [AppColors.dark, AppColors.gold],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    prayer['name']!,
                                    style: theme.textTheme.bodyLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    DataFormatter.formateTime(prayer['time']!),
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.headlineSmall
                                        ?.copyWith(color: AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 120,
                        viewportFraction: 0.3,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.2,
                      ),
                    ),
                  ),

                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: NextPrayerWidget(prayerTimesMap: prayerTimesMap),
                  ),
                ],
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

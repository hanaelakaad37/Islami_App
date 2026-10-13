import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/di/app_di.dart';
import 'package:islami/modules/layout/hadith/presentation/manager/hadith_bloc.dart';
import 'package:islami/modules/layout/hadith/presentation/pages/hadith_card.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/theme/app_colors.dart';

class Hadith extends StatelessWidget {
  const Hadith({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HadithBloc>()..add(const GetHadithsEvent()),
      child: const _HadithBody(),
    );
  }
}

class _HadithBody extends StatelessWidget {
  const _HadithBody();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Stack(
      children: [
        Positioned.fill(child: Assets.images.hadithBg.image(fit: BoxFit.cover)),
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
                const SizedBox(height: 20),
                Expanded(
                  child: BlocBuilder<HadithBloc, HadithState>(
                    builder: (context, state) {
                      if (state.status == HadithStatus.loading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.gold,
                          ),
                        );
                      }

                      if (state.status == HadithStatus.error) {
                        return Center(
                          child: Text(
                            state.errorMessage ?? "An error occurred",
                            style: TextStyle(color: AppColors.gold),
                          ),
                        );
                      }

                      if (state.status == HadithStatus.success) {
                        return CarouselSlider(
                          items: state.hadiths
                              .map((hadith) => HadithCard(hadithEntity: hadith))
                              .toList(),
                          options: CarouselOptions(
                            height: mediaQuery.size.height * 0.6,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration: const Duration(
                              milliseconds: 800,
                            ),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            scrollDirection: Axis.horizontal,
                          ),
                        );
                      }

                      return const SizedBox();
                    },
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

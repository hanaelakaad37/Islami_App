import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/gen/assets.gen.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../manager/reciters_bloc.dart';
class RecitersView extends StatefulWidget {
  const RecitersView({super.key});

  @override
  State<RecitersView> createState() => _RecitersViewState();
}

class _RecitersViewState extends State<RecitersView> {
  final Map<int, int> currentSurahs = {};
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<RecitersBloc, RecitersState>(
      builder: (context, state) {
        if (state is RecitersLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.gold,),);
        }

        if (state is RecitersError) {
          return Center(
            child: Text(
              state.message,
              style: TextStyle(
                color: AppColors.gold,
              ),
            ),
          );
        }

        if (state is RecitersSuccess) {
          return ListView.separated(
            itemCount: state.recitersEntity.reciters.length,
            itemBuilder: (context, index) {
              final reciter = state.recitersEntity.reciters[index];
              final moshaf = reciter.moshaf.first;
              final currentSurah = currentSurahs[index] ?? 1;
              final surahNumber = currentSurah.toString().padLeft(3, '0');
              final url = '${moshaf.server}$surahNumber.mp3';
              final isCurrentReciter = state.currentURL == url;
              final isMuted = isCurrentReciter && state.isMuted;

              return Container(
                width: double.infinity,
                height: 160,
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
                        color: AppColors.dark.withValues(alpha: 0.3),)
                          : Assets.images.soundWave11.image(color: AppColors
                          .dark.withValues(alpha: 0.3),),
                    ),

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                reciter.name,
                                style: theme.textTheme.titleLarge,),

                              SizedBox(height: 8),

                              Text(
                                'Surah $currentSurah',
                                style: theme.textTheme.titleMedium,),

                              SizedBox(height: 8),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Previous
                                  IconButton(
                                    onPressed: currentSurah == 1 ? null
                                        : () {
                                      setState(() {
                                        currentSurahs[index] = currentSurah - 1;
                                      });

                                      final newSurah = currentSurah - 1;
                                      context.read<RecitersBloc>().add(
                                        PreviousSurahEvent(
                                          server: moshaf.server,
                                          currentSurah: newSurah,
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.skip_previous,
                                      size: 40,
                                      color: AppColors.dark,
                                    ),
                                  ),

                                  /// Play / Pause
                                  IconButton(
                                    onPressed: () {
                                      context.read<RecitersBloc>().add(
                                        PlayReciterEvent(url),
                                      );
                                    },
                                    icon:
                                    isCurrentReciter && state.isPlaying
                                        ? Assets.icons.pause.svg()
                                        : Assets.icons.polygon.svg(),

                                  ),

                                  // Mute
                                  IconButton(
                                    onPressed: isCurrentReciter
                                        ? () {
                                      context.read<RecitersBloc>().add(
                                        MuteReciterEvent(),
                                      );
                                    }
                                        : null,
                                    icon: isMuted
                                        ? Assets.icons.volumeCross.svg()
                                        : Assets.icons.volumeHigh.svg(),
                                  ),
                                  // Next
                                  IconButton(
                                    onPressed: currentSurah == 114 ? null
                                        : () {
                                      setState(() {
                                        currentSurahs[index] = currentSurah + 1;
                                      });
                                      final newSurah = currentSurah + 1;
                                      context.read<RecitersBloc>().add(
                                        NextSurahEvent(
                                          server: moshaf.server,
                                          currentSurah: newSurah,
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.skip_next,
                                      size: 40,
                                      color: AppColors.dark,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
          );
        }

        return SizedBox();
      },
    );
  }
}
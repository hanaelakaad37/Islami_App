import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/theme/app_colors.dart';

import '../../../../../../core/gen/assets.gen.dart';
import '../../manager/radio_bloc.dart';

class RadiosView extends StatefulWidget {
  const RadiosView({super.key});

  @override
  State<RadiosView> createState() => _RadiosViewState();
}

class _RadiosViewState extends State<RadiosView> {
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<RadioBloc, RadioState>(
      builder: (context, state) {
        if (state is RadioLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.gold,),
          );
        }

        if (state is RadioError) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is RadioSuccess) {
          return ListView.separated(
            itemCount: state.radioEntity.radios.length,
            itemBuilder: (context, index) {
              final radios = state.radioEntity.radios[index];
              final isMuted = state.currentURL == radios.url && state.isMuted;
              final isPlaying = state.isPlaying &&
                  state.currentURL == radios.url;

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
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                " ${radios.name}",
                                style: theme.textTheme.titleLarge,
                              ),
                              const SizedBox(height: 26),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (isPlaying) {
                                        context.read<RadioBloc>().add(
                                          StopAudioEvent(),
                                        );
                                      } else {
                                        context.read<RadioBloc>().add(
                                          PlayAudioEvent(
                                            url: radios.url,
                                          ),
                                        );
                                      }
                                    },
                                    icon: isPlaying
                                        ? Assets.icons.pause.svg()
                                        : Assets.icons.polygon.svg(),
                                  ),

                                  IconButton(
                                    onPressed: () {
                                      if (state.currentURL ==
                                          radios.url) {
                                        context.read<RadioBloc>().add(
                                          ToggleMuteEvent(),
                                        );
                                      }
                                    },
                                    icon: isMuted
                                        ? Assets.icons.volumeCross.svg()
                                        : Assets.icons.volumeHigh.svg(),
                                  ),
                                ],
                              )
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
              return const SizedBox(height: 16);
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}

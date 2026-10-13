import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/modules/layout/radio/presenration/pages/widgets/radio_tab_bar.dart';
import 'package:islami/modules/layout/radio/presenration/pages/widgets/radio_view.dart';
import 'package:islami/modules/layout/radio/presenration/pages/widgets/reciters_view.dart';

import '../../../../../core/di/app_di.dart';
import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/theme/app_colors.dart';
import '../manager/radio_bloc.dart';
import '../manager/reciters_bloc.dart';
class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Assets.images.radioBg.image(fit: BoxFit.cover)),
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

                DefaultTabController(
                  length: 2,
                  child: Expanded(
                    child: Column(
                      children: [
                        RadioTabBar(),
                        SizedBox(height: 16),
                        Expanded(
                          child: MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) =>
                                getIt<RadioBloc>()
                                  ..add(GetRadioEvent()),
                              ),
                              BlocProvider(
                                create: (context) =>
                                getIt<RecitersBloc>()
                                  ..add(GetRecitersEvent()),
                              ),
                            ],
                            child: TabBarView(
                              children: [
                                RadiosView(),
                                RecitersView(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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


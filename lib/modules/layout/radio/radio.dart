import 'package:flutter/material.dart';
import 'package:islami/modules/layout/radio/radio_screen.dart';
import 'package:islami/modules/layout/radio/radio_tab_bar.dart';
import 'package:islami/modules/layout/radio/reciters_view.dart';

import '../../../core/gen/assets.gen.dart';
import '../../../core/theme/app_colors.dart';

class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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

                        const SizedBox(height: 16),

                        const Expanded(
                          child: TabBarView(
                            children: [RadioScreen(), RecitersView()],
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

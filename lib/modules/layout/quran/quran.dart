import 'package:flutter/material.dart';
import 'package:islami/core/app_routes/app_routes_name.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/model/sura_data_model.dart';
import 'package:islami/modules/layout/quran/widgets/sura_item.dart';

import '../../../core/gen/assets.gen.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Assets.images.quranBg.image(fit: BoxFit.cover),
          ),
          Container(color: AppColors.dark.withValues(alpha: 0.7)),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Assets.images.islami.image(
                        width: 291,
                        height: 171,
                      ),
                    ),
                    TextFormField(
                      cursorColor: AppColors.gold,
                      decoration: InputDecoration(
                        hintText: "Sura Name ",
                        hintStyle: textTheme.bodyLarge,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.gold),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.gold),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.gold),
                        ),

                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Assets.icons.quran.svg(
                            colorFilter: ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Most Recently ",
                          style: textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 150,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 150,
                            width: 283,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.gold,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Al-Anbiya",
                                        style: textTheme.titleLarge,
                                      ),
                                      Text(
                                        "الأنبياء",
                                        style: textTheme.titleLarge,
                                      ),
                                      Text(
                                        "112 Verses  ",
                                        style: textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Assets.images.imgMostRecent.image(),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10);
                        },
                        itemCount: 5,
                      ),
                    ),
                    SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Suras List ", style: textTheme.bodyLarge),
                      ),
                    ),

                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SuraItem(
                          suraDataModel: Suras[index],
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutesName.quranDetails,
                              arguments: Suras[index],
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: AppColors.white,
                          endIndent: 50,
                          indent: 50,
                        );
                      },
                      itemCount: Suras.length,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

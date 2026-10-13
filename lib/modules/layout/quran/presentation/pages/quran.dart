import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/app_routes/app_routes_name.dart';
import 'package:islami/core/di/app_di.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/modules/layout/quran/domain/entities/quran_entity.dart';
import 'package:islami/modules/layout/quran/presentation/manager/quran_bloc.dart';
import 'package:islami/modules/layout/quran/presentation/pages/widgets/sura_item.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/services/RecentSuraService .dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  List<int> _recentSuraNumbers = [];

  @override
  void initState() {
    super.initState();
    _loadRecentSuras();
  }

  Future<void> _loadRecentSuras() async {
    final list = await RecentSuraService.getRecentSuras();
    if (mounted) {
      setState(() {
        _recentSuraNumbers = list;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) =>
      getIt<QuranBloc>()
        ..add(const GetSurasEvent()),
      child: Scaffold(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Assets.images.islami.image(
                          width: 291,
                          height: 171,
                        ),
                      ),
                      Builder(builder: (context) {
                        return TextFormField(
                          cursorColor: AppColors.gold,
                          onChanged: (value) {
                            context
                                .read<QuranBloc>()
                                .add(SearchSurasEvent(value));
                          },
                          decoration: InputDecoration(
                            hintText: "Sura Name",
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
                        );
                      }),
                      const SizedBox(height: 20),

                      BlocBuilder<QuranBloc, QuranState>(
                        builder: (context, state) {
                          if (_recentSuraNumbers.isEmpty || state.allSuras
                              .isEmpty) {
                            return const SizedBox();
                          }

                          final List<SuraEntity> recentSuras = [];
                          for (final num in _recentSuraNumbers) {
                            final match = state.allSuras.where((s) =>
                            s.suraNumber == num);
                            if (match.isNotEmpty) {
                              recentSuras.add(match.first);
                            }
                          }

                          if (recentSuras.isEmpty) {
                            return const SizedBox.shrink();
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 4),
                                child: Text(
                                  "Most Recently",
                                  style: textTheme.bodyLarge,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 150,
                                child: ListView.separated(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: recentSuras.length,
                                  separatorBuilder: (context,
                                      index) => const SizedBox(width: 10),
                                  itemBuilder: (context, index) {
                                    final sura = recentSuras[index];
                                    return GestureDetector(
                                      onTap: () async {
                                        await RecentSuraService.saveSura(
                                          sura.suraNumber,
                                        );
                                        _loadRecentSuras();
                                        if (!context.mounted) return;
                                        Navigator.pushNamed(context,
                                          AppRoutesName.quranDetails,
                                          arguments: sura,
                                        );
                                      },
                                      child: Container(
                                        height: 150,
                                        width: 283,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              20),
                                          color: AppColors.gold,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(16),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      sura.suraNameEn,
                                                      style: textTheme
                                                          .titleLarge,
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                    ),
                                                    Text(
                                                      sura.suraNameAr,
                                                      style: textTheme
                                                          .titleLarge,
                                                      maxLines: 1,
                                                      overflow: TextOverflow
                                                          .ellipsis,
                                                    ),
                                                    Text(
                                                      '${sura
                                                          .versesCount} Verses',
                                                      style: textTheme
                                                          .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Assets.images.imgMostRecent.image(),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          );
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text("Suras List", style: textTheme.bodyLarge),
                      ),
                      const SizedBox(height: 10),

                      BlocBuilder<QuranBloc, QuranState>(
                        builder: (context, state) {
                          if (state.status == QuranStatus.loading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.gold,
                              ),
                            );
                          }

                          if (state.status == QuranStatus.error) {
                            return Center(
                              child: Text(
                                state.errorMessage ?? "An error occurred",
                                style: TextStyle(color: AppColors.gold),
                              ),
                            );
                          }

                          final suras = state.filteredSuras;

                          if (suras.isEmpty) {
                            return Center(
                              child: Text(
                                "No suras found",
                                style: TextStyle(color: AppColors.white),
                              ),
                            );
                          }

                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: suras.length,
                            separatorBuilder: (context, index) =>
                                Divider(
                                  color: AppColors.white,
                                  endIndent: 50,
                                  indent: 50,
                                ),
                            itemBuilder: (context, index) {
                              final sura = suras[index];

                              return SuraItem(
                                suraEntity: sura,
                                onTap: () async {
                                  await RecentSuraService.saveSura(
                                    sura.suraNumber,
                                  );
                                  _loadRecentSuras();
                                  if (!context.mounted) return;
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutesName.quranDetails,
                                    arguments: sura,
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

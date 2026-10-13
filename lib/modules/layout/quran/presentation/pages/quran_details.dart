import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/core/di/app_di.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/modules/layout/quran/domain/entities/quran_entity.dart';
import 'package:islami/modules/layout/quran/presentation/manager/quran_bloc.dart';
import 'package:islami/modules/layout/quran/presentation/pages/widgets/quran_details_background.dart';

class QuranDetails extends StatelessWidget {
  const QuranDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final suraEntity =
    ModalRoute
        .of(context)!
        .settings
        .arguments as SuraEntity;

    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) =>
      getIt<QuranBloc>()
        ..add(GetSuraVersesEvent(suraEntity.suraNumber)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(suraEntity.suraNameEn),
        ),
        body: Stack(
          children: [
            QuranDetailsBackground(
              suraEntity: suraEntity,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 80,
                bottom: 50,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: BlocBuilder<QuranBloc, QuranState>(
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
                          state.errorMessage ??
                              "Error loading verses",
                          style: TextStyle(
                            color: AppColors.gold,
                          ),
                        ),
                      );
                    }

                    final verses = state.verses;

                    return ListView.builder(
                      itemCount: verses.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Text(
                            '[${index + 1}] ${verses[index]}',
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyLarge?.copyWith(
                                color: AppColors.gold,
                                height: 2
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

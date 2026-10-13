import 'package:islami/core/di/app_di.dart';
import 'package:islami/modules/layout/quran/data/data_source/local_data_source.dart';
import 'package:islami/modules/layout/quran/data/data_source/sura_data_source_interface.dart';
import 'package:islami/modules/layout/quran/data/repository_imp/quran_repository_imp.dart';
import 'package:islami/modules/layout/quran/domain/repository/quran_repository.dart';
import 'package:islami/modules/layout/quran/domain/use_case/quran_use_case.dart';
import 'package:islami/modules/layout/quran/presentation/manager/quran_bloc.dart';

import '../domain/use_case/sura_verses_use_case.dart';

class QuranDi {
  static void setUp() {
    getIt
      ..registerLazySingleton<SuraDataSourceInterface>(() => LocalDataSource())
      ..registerLazySingleton<QuranRepository>(
        () => QuranRepositoryImp(getIt<SuraDataSourceInterface>()),
      )
      ..registerLazySingleton<GetSurasUseCase>(
        () => GetSurasUseCase(getIt<QuranRepository>()),
      )
      ..registerLazySingleton<GetSuraVersesUseCase>(
        () => GetSuraVersesUseCase(getIt<QuranRepository>()),
      )
      ..registerFactory<QuranBloc>(
        () => QuranBloc(
          getSurasUseCase: getIt<GetSurasUseCase>(),
          getSuraVersesUseCase: getIt<GetSuraVersesUseCase>(),
        ),
      );
  }
}

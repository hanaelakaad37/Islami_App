import 'package:islami/core/di/app_di.dart';
import 'package:islami/modules/layout/hadith/data/data_source/hadith_data_source_interface.dart';
import 'package:islami/modules/layout/hadith/data/data_source/hadith_local_data_source.dart';
import 'package:islami/modules/layout/hadith/data/repository_imp/hadith_repository_imp.dart';
import 'package:islami/modules/layout/hadith/domain/repository/hadith_repository.dart';
import 'package:islami/modules/layout/hadith/domain/use_case/get_hadith_use_case.dart';
import 'package:islami/modules/layout/hadith/presentation/manager/hadith_bloc.dart';

class HadithDi {
  static void setUp() {
    getIt
      ..registerLazySingleton<HadithDataSourceInterface>(
        () => HadithLocalDataSource(),
      )
      ..registerLazySingleton<HadithRepository>(
        () => HadithRepositoryImp(getIt<HadithDataSourceInterface>()),
      )
      ..registerLazySingleton<GetHadithsUseCase>(
        () => GetHadithsUseCase(getIt<HadithRepository>()),
      )
      ..registerFactory<HadithBloc>(
        () => HadithBloc(getHadithsUseCase: getIt<GetHadithsUseCase>()),
      );
  }
}

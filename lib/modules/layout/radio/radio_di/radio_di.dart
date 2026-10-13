import 'package:islami/modules/layout/radio/domain/use_cases/radio_use_case.dart';
import 'package:islami/modules/layout/radio/presenration/manager/reciters_bloc.dart';

import '../../../../core/di/app_di.dart';
import '../../../../core/network/dio_api_client.dart';
import '../../../../core/services/audio_play_service.dart';
import '../data/data_source/remote_data_source.dart';
import '../data/repository_imp/repository_imp.dart';
import '../domain/use_cases/reciters_use_case.dart';
import '../presenration/manager/radio_bloc.dart';

class RadioDi {
  static void setUp() {
    getIt
      ..registerLazySingleton<AudioPlayService>(() => AudioPlayService())
      ..registerLazySingleton(() => RemoteDataSource(getIt<DioApiClient>()))
      ..registerLazySingleton(() => RepositoryImp(getIt<RemoteDataSource>()))
      ..registerLazySingleton(() => RecitersUseCase(getIt<RepositoryImp>()))
      ..registerLazySingleton(() => RadioUseCase(getIt<RepositoryImp>()))
      ..registerFactory(
        () => RadioBloc(
          radioUseCase: getIt<RadioUseCase>(),
          audioPlayerService: getIt<AudioPlayService>(),
        ),
      )
      ..registerFactory(() => RecitersBloc());
  }
}

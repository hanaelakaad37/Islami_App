import 'package:islami/modules/layout/timer/data/data_source/azkar_local_data_source.dart';
import 'package:islami/modules/layout/timer/data/data_source/timer_remote_data_source.dart';
import 'package:islami/modules/layout/timer/data/repository_imp/timer_repository_imp.dart';
import 'package:islami/modules/layout/timer/domain/repository/timer_repository.dart';
import 'package:islami/modules/layout/timer/domain/use_case/azkar_use_case.dart';
import 'package:islami/modules/layout/timer/domain/use_case/timer_use_case.dart';
import 'package:islami/modules/layout/timer/presentation/manager/azkar_bloc.dart';
import 'package:islami/modules/layout/timer/presentation/manager/timer_bloc.dart';

import '../../../../core/di/app_di.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/network/dio_api_client.dart';

class TimerDi {
  static void setUp() {
    getIt
      ..registerLazySingleton(
        () =>
            TimerRemoteDataSource(DioApiClient(baseUrl: ApiConstants.baseURL2)),
      )
      ..registerLazySingleton(() => AzkarLocalDataSource())
      ..registerLazySingleton<TimerRepository>(
        () => TimerRepositoryImp(
          getIt<TimerRemoteDataSource>(),
          getIt<AzkarLocalDataSource>(),
        ),
      )
      ..registerLazySingleton(() => TimerUseCase(getIt<TimerRepository>()))
      ..registerLazySingleton(() => AzkarUseCase(getIt<TimerRepository>()))
      ..registerFactory(() => TimerBloc(getIt<TimerUseCase>()))
      ..registerFactory(() => AzkarBloc(getIt<AzkarUseCase>()));
  }
}

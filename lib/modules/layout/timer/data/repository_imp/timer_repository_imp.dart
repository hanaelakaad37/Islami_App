import 'package:dio/dio.dart';
import 'package:islami/core/network/api_results.dart';
import 'package:islami/modules/layout/timer/domain/entities/azkar_entity.dart';
import 'package:islami/modules/layout/timer/domain/entities/timer_entity.dart';
import 'package:islami/modules/layout/timer/domain/repository/timer_repository.dart';

import '../../../../../core/failures/server_faliuer.dart';
import '../data_source/azkar_local_data_source.dart';
import '../data_source/timer_data_source_interface.dart';

class TimerRepositoryImp implements TimerRepository {
  final TimerDataSourceInterface _dataSourceInterface;
  final AzkarLocalDataSource _localDataSource;

  TimerRepositoryImp(this._dataSourceInterface, this._localDataSource);

  @override
  Future<ApiResults<PrayerTimesEntity>> getTime() async {
    try {
      final response = await _dataSourceInterface.getPrayTime();

      return ApiResults.success(data: response);
    } on DioException catch (error) {
      final exception = ServerFailure(
        statusCode: error.response?.statusCode.toString() ?? '500',
        message:
            error.response?.data['message'] ??
            error.message ??
            'Something went wrong',
      );

      return ApiResults.failure(exception: exception);
    } catch (e) {
      return ApiResults.failure(
        exception: ServerFailure(statusCode: '500', message: e.toString()),
      );
    }
  }

  @override
  Future<List<AzkarEntity>> getAzkar(String category) async {
    return await _localDataSource.getAzkar(category);
  }
}

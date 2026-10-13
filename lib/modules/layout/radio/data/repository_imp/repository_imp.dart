import 'package:dio/dio.dart';
import 'package:islami/modules/layout/radio/data/data_source/data_source_interface.dart';
import 'package:islami/modules/layout/radio/domain/entities/radio_entity.dart';
import 'package:islami/modules/layout/radio/domain/entities/reciters_entity.dart';
import 'package:islami/modules/layout/radio/domain/repository/radio_repository.dart';

import '../../../../../core/failures/server_faliuer.dart';
import '../../../../../core/network/api_results.dart';

class RepositoryImp implements RadioRepository {
  final DataSourceInterface _dataSourceInterface;

  RepositoryImp(this._dataSourceInterface);

  @override
  Future<ApiResults<RecitersEntity>> getReciters() async {
    try {
      final response = await _dataSourceInterface.getReciters();

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
  Future<ApiResults<RadioEntity>> getRadio() async {
    try {
      final response = await _dataSourceInterface.getRadio();

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
}

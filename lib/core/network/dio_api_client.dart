import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'api_interface.dart';
import 'api_log_interceptors.dart';

class DioApiClient implements ApiInterface {
  final Dio dio;

  DioApiClient({String? baseUrl})
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl ?? ApiConstants.baseURL,
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
        ),
      ) {
    _interceptors();
  }

  void _interceptors() {
    dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          /// option >> header (tokens) , qaury parameters
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          return handler.next(error);
        },
      ),
    ]);
    ApiLogsInterceptor();
  }

  @override
  Future<dynamic> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.delete(endpoint, queryParameters: queryParameters);
  }

  @override
  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.get(endpoint, queryParameters: queryParameters);
  }

  @override
  Future<dynamic> patch(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    return await dio.patch(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  @override
  Future<dynamic> post(
    String endpoint, {
    queryParameters,
    Map<String, dynamic>? body,
  }) async {
    return await dio.post(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }

  @override
  Future<dynamic> put(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    return await dio.put(
      endpoint,
      queryParameters: queryParameters,
      data: body,
    );
  }
}

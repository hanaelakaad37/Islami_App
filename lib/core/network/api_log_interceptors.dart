import 'dart:developer';

import 'package:dio/dio.dart';

class ApiLogsInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log(
      "📡 ${options.method} Request: ${options.baseUrl}${options.path}",
      name: "API Logs",
    );

    log("📝 Headers: ${options.headers}", name: "API Logs");

    if (options.queryParameters.isNotEmpty) {
      log("🔎 Query Parameters: ${options.queryParameters}", name: "API Logs");
    }

    if (options.data != null) {
      log("📦 Body: ${options.data}", name: "API Logs");
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(
      "✅ API Logs Success Response: ${response.requestOptions.path}",
      name: "API Logs",
    );

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      "❌ API Logs Error Response: ${err.requestOptions.path}",
      name: "API Logs",
    );

    handler.reject(err);
  }
}

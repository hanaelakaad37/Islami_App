abstract class ApiInterface {
  Future<dynamic> get(String endpoint, {Map<String, dynamic>? queryParameters});

  Future<dynamic> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> put(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  });

  Future<dynamic> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  });

  Future<dynamic> patch(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  });
}

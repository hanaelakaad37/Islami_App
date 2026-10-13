import '../failures/server_faliuer.dart';

sealed class ApiResults<T> {
  const ApiResults();

  factory ApiResults.success({required T data}) {
    return SuccessRequest(data: data);
  }

  factory ApiResults.failure({required ServerFailure exception}) {
    return FailureRequest(exception);
  }
}

class FailureRequest extends ApiResults<Never> {
  final ServerFailure exception;

  FailureRequest(this.exception);
}

class SuccessRequest<T> extends ApiResults<T> {
  final T data;

  SuccessRequest({required this.data});
}

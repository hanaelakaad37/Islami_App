import 'faliure.dart';

class ServerFailure extends Failure {
  String? error, errorCode;
  String? message;

  ServerFailure({
    required super.statusCode,
    super.messageAr,
    super.messageEn,
    this.error,
    this.message,
    this.errorCode,
  });
}

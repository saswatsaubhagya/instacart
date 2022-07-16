import '../constants.dart';

class ApiError implements Exception {
  const ApiError({
    this.message = somethingWentWrong,
    this.statusCode,
    this.errorCode,
    this.stackTrace,
    this.response,
  }) : super();

  final String message;
  final int? statusCode;
  final int? errorCode;
  final StackTrace? stackTrace;
  final dynamic response;

  @override
  String toString() {
    return '''
ApiError:
  message: $message,
  statusCode: $statusCode,
  errorCode: $errorCode,
  stackTrace: $stackTrace
  response: $response,
    ''';
  }
}

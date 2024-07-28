import 'error_code.dart';

class NotValidException implements Exception {
  final ErrorCode errorCode;

  NotValidException(this.errorCode);

  @override
  String toString() {
    return "CustomException: ${errorCode.name} - ${errorCode.description}";
  }
}

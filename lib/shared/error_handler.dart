import 'package:dio/dio.dart';

class ErrorHandler {
  String title;
  String description;

  ErrorHandler({required this.title, required this.description});

  static ErrorHandler handle(dynamic error) {
    if (error is DioException) {
      return _handleDioException(error);
    } else {
      return ErrorHandler(
        title: "Unknown Error",
        description: "An unexpected error occurred.",
      );
    }
  }

  static ErrorHandler _handleDioException(DioException error) {
    String title;
    String description;

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        title = "Connection Timeout";
        description = "The connection to the server timed out.";
        break;
      case DioExceptionType.sendTimeout:
        title = "Send Timeout";
        description = "The request took too long to send.";
        break;
      case DioExceptionType.receiveTimeout:
        title = "Receive Timeout";
        description = "The server took too long to respond.";
        break;
      case DioExceptionType.badResponse:
        title = "Bad Response";
        description =
        "The server returned an invalid response: ${error.response?.statusCode ?? 'Unknown Status Code'}";
        break;
      case DioExceptionType.cancel:
        title = "Request Cancelled";
        description = "The request was cancelled.";
        break;
      case DioExceptionType.unknown:
      default:
        title = "Unknown Error";
        description = "An unknown error occurred.";
        break;
    }

    return ErrorHandler(title: title, description: description);
  }
}

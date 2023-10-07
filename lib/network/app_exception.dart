import 'package:bloc_demo_api/network/general_error_model.dart';

class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;
  final GeneralErrorModel? errorModel;

  AppException([this.message, this.prefix, this.url, this.errorModel]);
}

class AppException1 implements Exception {
  final String? errorModel;
  AppException1([this.errorModel]);
}

class GeneralApiResponseErrorException extends AppException1 {
  GeneralApiResponseErrorException([String? errorModel]) : super(errorModel);
}


import 'package:bloc_demo_api/constants/string_constants.dart';
import 'package:bloc_demo_api/network/app_exception.dart';
import 'package:bloc_demo_api/network/general_error_model.dart';

class FetchException implements Exception {
  final dynamic _errorModel;

  FetchException([this._errorModel]);

  GeneralErrorModel fetchErrorModel() {
    if (_errorModel == null) {
      return GeneralErrorModel(message: StringConstants.somethingWentWrong);
    }

    String model = StringConstants.somethingWentWrong;

    if (_errorModel is GeneralApiResponseErrorException) {
      model = (_errorModel as GeneralApiResponseErrorException)
          .errorModel
          .toString()
          .replaceFirst("Exception: ", "", 0);
      return GeneralErrorModel.fromRawJson(model);
    }

    return GeneralErrorModel(message: model);
  }
}

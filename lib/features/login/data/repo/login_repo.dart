

import 'package:clinc/core/networking/api_constants.dart';
import 'package:clinc/core/networking/api_error_handler.dart';
import 'package:clinc/core/networking/api_services.dart';
import 'package:clinc/features/login/data/model/login_model.dart';

import '../../../../core/networking/api_result.dart';

class LoginRepo {
 
  final ApiServices apiServices;

  LoginRepo({required this.apiServices});
  Future<ApiResult<LoginModel>> login(
      {required Map<String, dynamic> dataa}) async {
    try {
      var response = await apiServices.postData(urll: ApiConstance.login, data: dataa);
      print(response.data);
      return ApiResult.success(LoginModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

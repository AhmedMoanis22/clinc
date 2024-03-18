

import 'package:clinc/core/networking/api_constants.dart';
import 'package:clinc/core/networking/api_error_handler.dart';
import 'package:clinc/core/networking/api_services.dart';
import 'package:clinc/features/sign_up/data/model/sign_up_model.dart';

import '../../../../core/networking/api_result.dart';

class SignUpRepo {
 
  final ApiServices apiServices;

  SignUpRepo({required this.apiServices});
  Future<ApiResult<SignUpModel>> signUp(
      {required Map<String, dynamic> dataa}) async {
    try {
      var response = await apiServices.postData(urll: ApiConstance.signup, data: dataa);
      print(response.data);
      return ApiResult.success(SignUpModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_services.dart';
import '../model/home_model.dart';

class HomeRepo {
  final ApiServices apiServices;

  HomeRepo({required this.apiServices});
  Future<ApiResult<HomeModel>> homeData() async {
    try {
      var response = await apiServices.getData(urll: ApiConstance.home);
      print(response.data);
      return ApiResult.success(HomeModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

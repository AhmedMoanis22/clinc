import 'package:clinc/features/home/data/model/home_model.dart';
import 'package:clinc/features/login/logic/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/home_repo.dart';

class HomeCubit extends Cubit<LoginState<HomeModel>> {
  HomeCubit(this.homeRepo) : super(const LoginState.initial());

  static HomeCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo;
  HomeModel? homeModell;

  void recommendationDoctorInfo() async {
    emit(const LoginState.loading());
    var data = await homeRepo.homeData();
    print(data);
    data.when(success: (HomeModel homeModel) {
      homeModell = homeModel;
      print(homeModell!.message);
      emit(LoginState.success(homeModel));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message!));
    });
  }
}

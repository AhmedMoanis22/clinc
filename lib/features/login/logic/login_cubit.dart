import 'package:clinc/core/helper/shared_prefrences.dart';
import 'package:clinc/features/login/data/model/login_model.dart';
import 'package:clinc/features/login/logic/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/login_repo.dart';

class LoginCubit extends Cubit<LoginState<LoginModel>> {
  LoginCubit(this.loginRepo) : super(const LoginState.initial());

  static LoginCubit get(context) => BlocProvider.of(context);
  final LoginRepo loginRepo;
  LoginModel? loginModel;

  final formkey = GlobalKey<FormState>();

  void emitLoginState({
    required String email,
    required String password,
  }) async {
    emit(const LoginState.loading());
    var data = await loginRepo.login(dataa: {
      'email': email,
      'password': password,
    });
    data.when(success: (LoginModel loginModel) {
      loginModel = loginModel;
      MySharedPreferences.setString('username', loginModel.data!.username!);
      emit(LoginState.success(loginModel));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message!));
    });
  }
}

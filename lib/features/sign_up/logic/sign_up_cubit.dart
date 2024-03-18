import 'package:clinc/features/sign_up/data/model/sign_up_model.dart';
import 'package:clinc/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:clinc/features/sign_up/logic/sign_up_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState<SignUpModel>> {
  SignupCubit(this.signUpRepo) : super(const SignupState.initial());

  static SignupCubit get(context) => BlocProvider.of(context);

  final SignUpRepo signUpRepo;

  final formkey = GlobalKey<FormState>();

  void emitSignupState({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phone,
  }) async {
    emit(const SignupState.signupLoading());
    var data = await signUpRepo.signUp(dataa: {
      'name': name,
      'email': email,
      'phone': phone,
      'gender': 1,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });
    data.when(success: (SignUpModel signUpModel) {
      emit(SignupState.signupSuccess(signUpModel));
    }, failure: (error) {
      emit(SignupState.signupError(error: error.apiErrorModel.message!));
    });
  }
}

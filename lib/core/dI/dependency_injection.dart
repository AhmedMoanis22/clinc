import 'package:clinc/core/networking/api_factory.dart';
import 'package:clinc/features/home/data/repo/home_repo.dart';
import 'package:clinc/features/home/logic/home_cubit.dart';
import 'package:clinc/features/login/data/repo/login_repo.dart';
import 'package:clinc/features/login/logic/login_cubit.dart';
import 'package:clinc/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:clinc/features/sign_up/logic/sign_up_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../networking/api_services.dart';

final getIt = GetIt.instance;
Future<void> setupGetit() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio: dio));

   getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(apiServices: getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(apiServices: getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));


  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(apiServices: getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));

  
 
}

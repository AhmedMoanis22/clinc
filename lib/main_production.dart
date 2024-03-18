import 'package:clinc/core/dI/dependency_injection.dart';
import 'package:clinc/core/helper/bloc_observation.dart';
import 'package:clinc/core/routing/app_router.dart';
import 'package:clinc/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await ScreenUtil.ensureScreenSize();
  setupGetit();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

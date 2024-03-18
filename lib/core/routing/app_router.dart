import 'package:clinc/core/dI/dependency_injection.dart';
import 'package:clinc/core/helper/shared_prefrences.dart';
import 'package:clinc/core/routing/routes.dart';
import 'package:clinc/features/home/logic/home_cubit.dart';
import 'package:clinc/features/home/ui/home_screen.dart';
import 'package:clinc/features/login/logic/login_cubit.dart';
import 'package:clinc/features/login/ui/login_screen.dart';
import 'package:clinc/features/onboarding/onboarding_screen.dart';
import 'package:clinc/features/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/sign_up/ui/sign_up_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final argument = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        if (MySharedPreferences.getString("onBoarding") == "true") {
          if (MySharedPreferences.getString("login") == "true") {
            return MaterialPageRoute(
              builder: (_) => BlocProvider(
                  create: (BuildContext context) => getIt<HomeCubit>()..recommendationDoctorInfo(),
                  child: const HomeScreen()),
            );
          }
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) => getIt<LoginCubit>(),
                child: const LoginScreen()),
          );
        }
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (BuildContext context) => getIt<LoginCubit>(),
              child: const LoginScreen()),
        );
      case Routes.signUpScreen:
        if (MySharedPreferences.getString("signup") == "true") {
          return MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          );
        }
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (BuildContext context) => getIt<SignupCubit>(),
              child: const SignupScreen()),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (BuildContext context) => getIt<HomeCubit>(),
              child: const HomeScreen()),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

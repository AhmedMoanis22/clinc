import 'package:clinc/core/helper/extension.dart';
import 'package:clinc/features/login/ui/widgets/dont_have_account.dart';
import 'package:clinc/features/login/ui/widgets/email_and_password.dart';
import 'package:clinc/features/login/ui/widgets/login_bloclistner.dart';
import 'package:clinc/features/login/ui/widgets/sign_in_with.dart';
import 'package:clinc/features/login/ui/widgets/terms_and_privacy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpacing(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpacing(36),
                const Column(
                  children: [
                    EmailAndPassword(),
                  ],
                ),
                verticalSpacing(20),
                verticalSpacing(15),
                const SignInWith(),
                verticalSpacing(15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/google.svg'),
                      SizedBox(
                        width: 32.w,
                      ),
                      const Icon(
                        Icons.facebook,
                        color: ColorManger.mainBlue,
                        size: 30,
                      ),
                      SizedBox(
                        width: 32.w,
                      ),
                      const Icon(
                        Icons.apple,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                verticalSpacing(32),
                const TermsAndConditionsText(),
                verticalSpacing(32),
                const AlreadyHaveAccount(),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

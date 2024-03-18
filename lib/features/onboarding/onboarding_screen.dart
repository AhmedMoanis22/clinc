import 'package:clinc/core/helper/extension.dart';
import 'package:clinc/core/helper/spacing.dart';
import 'package:clinc/core/theming/style.dart';
import 'package:clinc/features/onboarding/widgets/doc_image_and_text.dart';
import 'package:clinc/features/onboarding/widgets/doc_logo_and_name.dart';
import 'package:clinc/core/widgets/get_started_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helper/shared_prefrences.dart';
import '../../core/routing/routes.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30.h,
              bottom: 30.h,
            ),
            child: Column(
              children: [
                const DocLogoAndName(),
                verticalSpacing(30),
                const DoctorImageAndText(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Text(
                    'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                    style: TextStyles.font13GrayRegular,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 90.h),
                    child: GetStartedButton(
                        onPressed: () {
                          context.pushNamed(Routes.loginScreen);
                          MySharedPreferences.setString("onBoarding", "true");
                        },
                        text: 'Get Started')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

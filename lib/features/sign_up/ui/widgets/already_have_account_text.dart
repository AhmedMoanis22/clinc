import 'package:clinc/core/helper/extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


import '../../../../core/routing/routes.dart';
import '../../../../core/theming/style.dart';


class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: TextStyles.font11DarkBlueRegular,
          ),
          TextSpan(
            text: ' Login',
            style: TextStyles.font14SemiBlueBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.loginScreen);
              },
          ),
        ],
      ),
    );
  }
}
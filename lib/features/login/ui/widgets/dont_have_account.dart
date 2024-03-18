import 'package:clinc/core/helper/extension.dart';
import 'package:clinc/core/theming/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/routing/routes.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
      
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account ?',
              style: TextStyles.font11DarkBlueRegular,
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyles.font14SemiBlueBold,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed(Routes.signUpScreen);
                },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:clinc/core/theming/style.dart';
import 'package:flutter/material.dart';

class SignInWith extends StatelessWidget {
  const SignInWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 118.22,
          height: 1,
          decoration: const BoxDecoration(color: Color(0xFFE0E0E0)),
        ),
        Text(
          'Or sign in with',
          style: TextStyles.font14LightGrayRegular,
        ),
        Container(
          width: 118.22,
          height: 1,
          decoration: const BoxDecoration(color: Color(0xFFE0E0E0)),
        ),
      ],
    );
  }
}

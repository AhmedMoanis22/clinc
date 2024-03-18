import 'package:clinc/core/theming/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/style.dart';



class PasswordValidations extends StatelessWidget {
  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowercase,
    required this.hasUppercase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowercase),
        verticalSpacing(2),
        buildValidationRow('At least 1 uppercase letter', hasUppercase),
        verticalSpacing(2),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters),
        verticalSpacing(2),
        buildValidationRow('At least 1 number', hasNumber),
        verticalSpacing(2),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorManger.gray,
        ),
        horizentalSpacing(6),
        
        Text(
          text,
          style: TextStyles.font11DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: const Color.fromARGB(255, 5, 222, 12),
            decorationThickness: 2,
            color: hasValidated ? ColorManger.gray : ColorManger.darkBlue,
          ),
        )
      ],
    );
  }
}
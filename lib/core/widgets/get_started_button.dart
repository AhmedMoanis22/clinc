import 'package:clinc/core/theming/colors.dart';
import 'package:clinc/core/theming/style.dart';
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton(
      {super.key, required this.onPressed, required this.text});
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorManger.mainBlue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(
          const Size(311, 52),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}

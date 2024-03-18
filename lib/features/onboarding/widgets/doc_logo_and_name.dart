import 'package:clinc/core/helper/spacing.dart';
import 'package:clinc/core/theming/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svg/logo.svg'),
      horizentalSpacing(10),
        Text('Docdoc', style: TextStyles.font24Black700Weight),
        SizedBox(
          height: 30.h,
        ),
       
      ],
    );
  }
}

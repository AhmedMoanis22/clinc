import 'package:flutter/material.dart';

import '../../../../core/theming/style.dart';

class HomeScreenTitle extends StatelessWidget {
  const HomeScreenTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.font18BlackSemiboldWeight,
        ),
        const Spacer(),
        Text(
          'See All',
          style: TextStyles.font12BlueRegular,
        ),
      ],
    );
  }
}

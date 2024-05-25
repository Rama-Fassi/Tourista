import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

class AirlineWidget extends StatelessWidget {
  const AirlineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.imagesTestAirline,
          width: 20,
          height: 20,
        ),
        Gap(10),
        Text(
          'United Airlines',
          style: AppStyles.styleInterRegular14(context),
        )
      ],
    );
  }
}

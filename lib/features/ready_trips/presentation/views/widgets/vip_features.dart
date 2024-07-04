import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

class VIPFeatures extends StatelessWidget {
  const VIPFeatures({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesEllipse),
        Gap(8),
        Text(
          'business class flight ticket',
          style: AppStyles.styleSourceRegular20(context),
        )
      ],
    );
  }
}

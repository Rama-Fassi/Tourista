import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

class AirportCard extends StatelessWidget {
  const AirportCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.imagesIconsAirport,
        ),
        const Gap(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Miami international Airport ",
              style: AppStyles.styleInterSemiBold18(context),
            ),
            Text(
              "Miami, Florida, United States",
              style: AppStyles.styleInterRegular16(context),
            ),
          ],
        )
      ],
    );
  }
}

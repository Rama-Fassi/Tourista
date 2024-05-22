import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/icon_container.dart';

class CitySelectLocationCard extends StatelessWidget {
  const CitySelectLocationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconContainer(
          padding: 6,
          icon: SvgPicture.asset(
            Assets.imagesIconsSelectLocation,
            color: kPrimaryColor,
          ),
        ),
        Gap(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Damascus',
              style: AppStyles.styleInterSemiBold18(context)
                  .copyWith(fontSize: 15.5),
            ),
            Text(
              'Capital of Syria',
              style: AppStyles.styleInterMedium16(context),
            )
          ],
        )
      ],
    );
  }
}

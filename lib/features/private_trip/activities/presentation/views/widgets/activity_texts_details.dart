import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utlis/app_assets.dart';
import '../../../../../../core/utlis/styles.dart';
import 'icon_with_text_row.dart';

class ActivityTextsDetails extends StatelessWidget {
  const ActivityTextsDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Museum of The Future',
          // overflow: TextOverflow.ellipsis,
          style: AppStyles.styleQuickBold25(context)
              .copyWith(color: kPrimaryColor),
          textAlign: TextAlign.left,
        ),
        const Gap(20),
        const IconWithTextRow(
          assetName: Assets.imagesIconsHours,
          data: "Opening Hours 10:00-16:00",
        ),
        const Gap(15),
        const IconWithTextRow(
          assetName: Assets.imagesIconsHour,
          data: "Recommended time : 2 for 4 hours",
        ),
        const Gap(15),
        const IconWithTextRow(
          assetName: Assets.imagesIconsType,
          data: "Entertainment Activity ",
        ),
        const Gap(20),
        const Divider(
          color: Colors.grey,
          height: 20,
          thickness: 1,
          indent: 20,
          endIndent: 20,
        ),
        const Gap(10),
        const IconWithTextRow(
          assetName: Assets.imagesIconsCirInfo,
          data: "About:",
          color: Color(0xffEA4335),
        ),
        const Gap(15),
        Text(
          'one of the largest waterparks in the Middle East and features variety of thrilling water slides, rides, and attractions for visitors of all ages. Aquaventure Waterpark also includes a private beach, river rides, splash areas for kids, and opportunities for swimming and sunbathing one of the largest waterparks in the Middle East and features variety of thrilling water slides, rides, and attractions for visitors of all ages. Aquaventure Waterpark also includes a private beach, river rides, splash areas for kids, and opportunities for swimming and sunbathing one of the largest waterparks in the Middle East and features variety of thrilling water slides, rides, and attractions for visitors of all ages. Aquaventure Waterpark also includes a private beach, river rides, splash areas for kids, and opportunities for swimming and sunbathing water slides, rides, and attractions for visitors of all ages. Aquaventure Waterpark also includes a private beach, river rides, splash areas for kids, and opportunities for swimming and sunbathing',
          style: AppStyles.styleSourceSemiBold20(context),
        )
      ],
    );
  }
}

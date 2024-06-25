import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constants.dart';
import '../../../../../core/utlis/styles.dart';

class CircleAvatarWithUserName extends StatelessWidget {
  const CircleAvatarWithUserName({
    super.key,
    required this.screenWidth,
    required this.screenheight,
  });

  final double screenWidth;
  final double screenheight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: screenheight * .215,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kCircleAvatarColoe,
              border: Border.all(color: kYellowColor, width: 3),
            ),
            child: Center(
              child: Text(
                "RF",
                style: AppStyles.styleInterBold27(context)
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          const Gap(10),
          Text(
            'Rama Fassi',
            style: AppStyles.styleInterBold27(context)
                .copyWith(color: Colors.white),
          ),
          const Gap(8),
          Text(
            'Points 350',
            style: AppStyles.styleInterSemiBold18(context)
                .copyWith(color: kYellowColor),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}

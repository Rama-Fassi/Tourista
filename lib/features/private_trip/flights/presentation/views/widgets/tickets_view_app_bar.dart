import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

class TickesViewAppBar extends StatelessWidget {
  const TickesViewAppBar({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: width,
          height: height * .09,
          color: kPrimaryColor,
        ),
        Positioned(
            top: height * .05,
            left: width * .12,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: kYellowColor, width: 2)),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  Text(
                    'DXB',
                    style: AppStyles.styleInterMedium18(context),
                  ),
                  Gap(10),
                  SvgPicture.asset(Assets.imagesIconsArrowRightLeft),
                  Gap(10),
                  Text(
                    'DXB  .',
                    style: AppStyles.styleInterMedium18(context),
                  ),
                  Text(
                    ' 17-5 to',
                    style: AppStyles.styleInterMedium18(context),
                  ),
                  Text(
                    ' 25-5 ',
                    style: AppStyles.styleInterMedium18(context),
                  ),
                  Gap(10),
                ],
              ),
            ))
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

class ThePlanContainer extends StatelessWidget {
  const ThePlanContainer(
      {super.key,
      required this.child,
      required this.data,
      required this.screenwidth});
  final Widget child;
  final String data;
  final double screenwidth;
  // final double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Container(
        width: screenwidth,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 5,
              color: Colors.grey.shade300,
              offset: const Offset(-3, 3)),
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 5,
              color: Colors.grey.shade300,
              offset: const Offset(3, -3))
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.imagesIconsActivities,
                    color: kPrimaryColor,
                  ),
                  const Gap(5),
                  Text(
                    data,
                    style: AppStyles.styleInterBold20(context)
                        .copyWith(color: kPrimaryColor),
                  ),
                ],
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}

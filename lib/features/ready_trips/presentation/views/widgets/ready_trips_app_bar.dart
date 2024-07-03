import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';

class ReadyTripsAppBar extends StatelessWidget {
  const ReadyTripsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesTouristaLogoGreen),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: kPrimaryColor,
              size: 30,
            ))
      ],
    );
  }
}

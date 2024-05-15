import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/core/utlis/app_assets.dart';

class EartLogo extends StatelessWidget {
  const EartLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        Assets.imagesEarthLogo,
        width: 80,
        height: 100,
      ),
    );
  }
}
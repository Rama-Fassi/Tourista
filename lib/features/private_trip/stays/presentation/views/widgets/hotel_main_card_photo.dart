import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/app_assets.dart';

class HotelMainCardPhoto extends StatelessWidget {
  const HotelMainCardPhoto({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * .31,
      child: AspectRatio(
          aspectRatio: 2.5 / 4.75,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                fit: BoxFit.fill,
                Assets.imagesHotelTest,
              ))),
    );
  }
}

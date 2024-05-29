import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tourista/core/utlis/app_assets.dart';

class ErrAnimation extends StatelessWidget {
  const ErrAnimation({
    super.key,
    required this.errMessage,
  });
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(Assets.imagesLottieErrAnimation),
        Text(errMessage)
      ],
    );
  }
}

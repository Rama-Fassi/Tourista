import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
    required this.screenWidth,
   required this.text,
  });

  final double screenWidth;
  final String text;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: text,
      width: screenWidth * .80,
      borderRadius: 8,
      height: 53,
      style: AppStyles.styleInterBold25(context).copyWith(color: Colors.white),
      color: kPrimaryColor,
    );
  }
}
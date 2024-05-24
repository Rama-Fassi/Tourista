import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';

class CustomContainerbehindButton extends StatelessWidget {
  const CustomContainerbehindButton({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: 80,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        kboxShadow,
      ]),
    );
  }
}
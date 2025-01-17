import 'package:flutter/material.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 8,
      height: 8,
      decoration: ShapeDecoration(
        color:
            isActive ? const Color(0xffE8E8E8) : Colors.black.withOpacity(.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}

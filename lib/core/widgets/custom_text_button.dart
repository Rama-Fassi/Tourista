import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.data,
    required this.style,
    required this.onPressed,
  });
  final String data;
  final TextStyle? style;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(data, style: style),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.icon,
      required this.hintText,
      this.keyboardType,
      this.onChanged,
      this.showPass = false,
      required this.color,
      required this.controller});
  final Widget icon;
  final String hintText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Color color;
  final TextEditingController controller;
  final bool showPass;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: showPass,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      cursorColor: color,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        hoverColor: color,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: color, width: 2)),
        focusColor: color,
        prefixIcon: icon,
        hintText: hintText,
        hintStyle: AppStyles.styleSourceRegular20(context).copyWith(
          color: Colors.black.withOpacity(0.54),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color, width: 2),
        ),
      ),
    );
  }
}

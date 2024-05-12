import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.icon,
      required this.hintText,
      this.keyboardType,
      this.onChanged,
      required this.color});
  final Widget icon;
  final String hintText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
            borderSide: BorderSide(color: color, width: 3)),
        focusColor: color,
        prefixIcon: icon,
        hintText: hintText,
        hintStyle: AppStyles.styleSourceRegular20(context)
            .copyWith(color: Colors.black.withOpacity(0.54), fontSize: 22),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color, width: 3),
        ),
      ),
    );
  }
}

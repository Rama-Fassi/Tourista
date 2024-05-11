
import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.icon,
      required this.hintText,
      this.keyboardType,
      this.onChanged});
  final Widget icon;
  final String hintText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      cursorColor: kYellowColor.withOpacity(0.50),
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        hoverColor: kPrimaryColor,
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: kYellowColor.withOpacity(0.5), width: 3)),
        focusColor: kPrimaryColor,
        prefixIcon: icon,
        hintText: hintText,
        hintStyle: AppStyles.styleSourceRegular20(context)
            .copyWith(color: Colors.black.withOpacity(0.54), fontSize: 22),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 3),
        ),
      ),
    );
  }
}

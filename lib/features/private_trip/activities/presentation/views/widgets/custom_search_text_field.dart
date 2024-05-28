import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tourista/core/utlis/app_assets.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField(
      {super.key, this.onChanged, this.onPressed, this.onSubmitted});
  final void Function(String)? onChanged;
  final void Function()? onPressed;
  final Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Search an activity',
        
        suffixIcon: IconButton(
            onPressed: onPressed,
            icon: SvgPicture.asset(
              Assets.imagesIconsSearch,
              width: 22,
            )),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.black.withOpacity(0.4), width: 2),
    );
  }
}

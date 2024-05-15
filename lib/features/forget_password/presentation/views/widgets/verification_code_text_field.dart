import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class VeriificationCodeTextField extends StatelessWidget {
  const VeriificationCodeTextField({
    super.key,
    required this.controller,
    required this.screenWidth,
  });

  final TextEditingController controller;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: PinCodeTextField(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        keyboardType: TextInputType.number,
        appContext: context,
        length: 6,
        controller: controller,
        cursorColor: kPrimaryColor,
        pastedTextStyle: const TextStyle(color: kPrimaryColor),
        cursorHeight: 18,
        textStyle: AppStyles.styleInterSemiBold18(context),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        pinTheme: PinTheme(
            fieldWidth: screenWidth * .1,
            activeColor: kPrimaryColor,
            selectedColor: kPrimaryColor,
            inactiveColor: Colors.black,
            disabledColor: Colors.black),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/forget_password/presentation/views/widgets/verification_code_text_field.dart';

class EnterVerifyCodeSection extends StatelessWidget {
  const EnterVerifyCodeSection({
    super.key,
    required this.screenWidth,
    required this.controller,
  });

  final double screenWidth;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(screenWidth * .15),
        Text(
          "Verify",
          style: AppStyles.styleInterBold25(context).copyWith(fontSize: 28),
        ),
        Gap(screenWidth * .04),
        Text(
          "Please enter the code we sent you ",
          style: AppStyles.styleInterMedium14(context)
              .copyWith(color: Colors.grey),
        ),
        Gap(screenWidth * .18),
        VeriificationCodeTextField(
            controller: controller, screenWidth: screenWidth),
      ],
    );
  }
}

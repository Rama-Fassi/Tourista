import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
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
        Gap(screenWidth * .13),
        Text(
          LocaleKeys.verify.tr(),
          style: AppStyles.styleInterBold25(context).copyWith(fontSize: 28),
        ),
        Gap(screenWidth * .04),
        Text(
          LocaleKeys.pleaseEnterTheCode.tr(),
          style: AppStyles.styleInterMedium14(context)
              .copyWith(color: Colors.grey),
        ),
        Gap(screenWidth * .16),
        VeriificationCodeTextField(
            controller: controller, screenWidth: screenWidth),
      ],
    );
  }
}

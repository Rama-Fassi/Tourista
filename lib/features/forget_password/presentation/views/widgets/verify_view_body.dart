import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/forget_password/presentation/views/widgets/enter_verify_code_section.dart';
import 'package:tourista/features/forget_password/presentation/views/widgets/verify_button_and_range.dart';

class VerifyViewBody extends StatefulWidget {
  const VerifyViewBody({super.key});

  @override
  State<VerifyViewBody> createState() => _VerifyViewBodyState();
}

class _VerifyViewBodyState extends State<VerifyViewBody> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenheight = MediaQuery.sizeOf(context).height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        EnterVerifyCodeSection(
            screenWidth: screenWidth, controller: controller),
        Gap(screenheight * .04),
        Text(
          LocaleKeys.DidntRecieveTheCode.tr(),
          style: AppStyles.styleInterMedium14(context)
              .copyWith(color: Colors.grey),
        ),
        Gap(screenheight * .01),
        Text(
          LocaleKeys.ResendPassword.tr(),
          style: AppStyles.styleInterBold16(context)
              .copyWith(color: kPrimaryColor),
        ),
        Gap(screenheight * .25),
        VerifyRangeAndButton(
          screenWidth: screenWidth,
          numberOfSteps: '1 of 2',
          start: 0,
          end: 0.5,
        )
      ],
    );
  }
}

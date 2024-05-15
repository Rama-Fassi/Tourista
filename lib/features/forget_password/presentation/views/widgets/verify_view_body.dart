import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        EnterVerifyCodeSection(
            screenWidth: screenWidth, controller: controller),
        Gap(screenWidth * .08),
        Text(
          'Didn’t Receive the Code ?',
          style: AppStyles.styleInterMedium14(context)
              .copyWith(color: Colors.grey),
        ),
        Gap(screenWidth * .02),
        Text(
          'Resend Code',
          style: AppStyles.styleInterBold16(context)
              .copyWith(color: kPrimaryColor),
        ),
        Gap(screenWidth * .4),
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

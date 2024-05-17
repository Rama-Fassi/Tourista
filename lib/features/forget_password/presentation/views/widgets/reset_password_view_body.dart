import 'package:flutter/material.dart';
import 'package:tourista/features/forget_password/presentation/views/widgets/create_a_new_password.dart';
import 'package:tourista/features/forget_password/presentation/views/widgets/verify_button_and_range.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenheight = MediaQuery.sizeOf(context).height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        CreateANewPasswordColumn(
          screenheight: screenheight,
          screenWidth: screenWidth,
          controller: controller,
          controller2: controller1,
        ),
        const Spacer(
          flex: 13,
        ),
        VerifyRangeAndButton(
            screenheight: screenheight,
            screenWidth: screenWidth,
            numberOfSteps: "2 of 2",
            start: 0,
            end: 1),
        Spacer()
      ],
    );
  }
}

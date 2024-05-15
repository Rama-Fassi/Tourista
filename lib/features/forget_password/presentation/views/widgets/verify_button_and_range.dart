import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';

class VerifyRangeAndButton extends StatelessWidget {
  const VerifyRangeAndButton({
    super.key,
    required this.screenWidth,
    required this.numberOfSteps,
    required this.start,
    required this.end,
  });

  final double screenWidth;
  final String numberOfSteps;
  final double start, end;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              const Spacer(),
              Text(
                numberOfSteps,
                style: AppStyles.styleInterSemiBold14(context),
              )
            ],
          ),
        ),
        Center(
          child: RangeSlider(
            inactiveColor: Colors.grey,
            labels: null,
            values: RangeValues(start, end),
            onChanged: (value) {},
            divisions: 10,
          ),
        ),
        Gap(screenWidth * .02),
        CustomButton(
            text: LocaleKeys.verify.tr(),
            width: screenWidth * .80,
            borderRadius: 10,
            height: screenWidth * .15,
            style: AppStyles.styleInterBold20(context)
                .copyWith(color: Colors.white),
            color: kPrimaryColor),
      ],
    );
  }
}

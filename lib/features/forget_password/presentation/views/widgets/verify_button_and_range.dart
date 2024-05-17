import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';

class VerifyRangeAndButton extends StatelessWidget {
  const VerifyRangeAndButton({
    super.key,
    required this.screenWidth,
    required this.numberOfSteps,
    required this.start,
    required this.end,
    required this.screenheight,
    required this.userId,
  });

  final double screenWidth, screenheight;
  final String numberOfSteps;
  final double start, end;
  final int userId;

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
        RangeSlider(
          inactiveColor: Colors.grey,
          labels: null,
          values: RangeValues(start, end),
          onChanged: (value) {},
          divisions: 10,
        ),
        Gap(screenheight * .01),
        CustomButton(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kResetPassword);
            },
            text: LocaleKeys.verify.tr(),
            width: screenWidth * .80,
            borderRadius: 10,
            height: screenheight * .08,
            style: AppStyles.styleInterBold20(context)
                .copyWith(color: Colors.white),
            color: kPrimaryColor),
      ],
    );
  }
}

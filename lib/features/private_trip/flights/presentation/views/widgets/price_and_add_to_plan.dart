import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';

class PriceAndAddToPlan extends StatelessWidget {
  const PriceAndAddToPlan({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'US\$443',
          style: AppStyles.styleSourceSemiBold22(context),
        ),
        Text(
          'US\$1,772${LocaleKeys.forAllTravellers.tr()}',
          style: AppStyles.styleInterMedium14(context)
              .copyWith(color: Colors.black.withOpacity(.5)),
        ),
        Gap(8),
        CustomButton(
            text: LocaleKeys.Add_To_The_plan.tr(),
            width: width * .25,
            borderRadius: 5,
            height: height * .035,
            style: AppStyles.styleSourceBold14(context)
                .copyWith(color: Colors.white),
            color: kPrimaryColor.withOpacity(.7))
      ],
    );
  }
}

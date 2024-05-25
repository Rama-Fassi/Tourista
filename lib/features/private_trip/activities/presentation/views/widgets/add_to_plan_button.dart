import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';

class AddToPlanButton extends StatelessWidget {
  const AddToPlanButton({
    super.key,
    required this.screenWidth,
    required this.onTap,
  });

  final double screenWidth;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: 80,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        kboxShadow,
      ]),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 50, right: 50, top: 13, bottom: 13),
        child: CustomButton(
          text: LocaleKeys.Add_To_The_plan.tr(),
          width: screenWidth * .6,
          borderRadius: 5,
          height: 50,
          style: AppStyles.styleSourceBold20(context)
              .copyWith(color: Colors.white),
          color: kPrimaryColor,
          onTap: onTap,
        ),
      ),
    );
  }
}

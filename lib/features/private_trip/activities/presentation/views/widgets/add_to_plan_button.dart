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
    return Padding(
      padding: const EdgeInsets.all(15),
      child: CustomButton(
        text: LocaleKeys.Add_To_The_plan.tr(),
        width: screenWidth * .8,
        borderRadius: 5,
        height: 50,
        style:
            AppStyles.styleSourceBold20(context).copyWith(color: Colors.white),
        color: kPrimaryColor,
        onTap: onTap,
      ),
    );
  }
}

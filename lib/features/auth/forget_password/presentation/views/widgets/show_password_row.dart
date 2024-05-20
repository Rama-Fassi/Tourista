import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';

class ShowPasswordRow extends StatelessWidget {
  const ShowPasswordRow(
      {super.key, required this.onChanged, required this.shoPass});
  final ValueChanged<bool?> onChanged;
  final bool shoPass;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Checkbox(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              activeColor: kPrimaryColor,
              checkColor: Colors.white,
              hoverColor: Colors.black,
              tristate: true,
              value: shoPass,
              onChanged: onChanged),
          Text(
            LocaleKeys.ShowPassowrd.tr(),
            style: AppStyles.styleInterMedium14(context),
          )
        ],
      ),
    );
  }
}

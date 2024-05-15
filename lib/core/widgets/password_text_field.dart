import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/widgets/custom_text_form_field.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: TextEditingController(),
      color: kPrimaryColor,
      icon: Padding(
        padding: const EdgeInsets.all(11),
        child: SvgPicture.asset(Assets.imagesIconsOutlineLock),
      ),
      hintText: LocaleKeys.password.tr(),
    );
  }
}
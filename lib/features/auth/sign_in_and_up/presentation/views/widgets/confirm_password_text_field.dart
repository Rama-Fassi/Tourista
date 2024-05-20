import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/widgets/custom_text_form_field.dart';

import '../../../../../../constants.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      color: kPrimaryColor,
      icon: Padding(
        padding: const EdgeInsets.all(11),
        child: SvgPicture.asset(Assets.imagesIconsFillLock),
      ),
      hintText: LocaleKeys.confirm_password.tr(),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/profile/presentation/views/widgets/sign_out_button.dart';
import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/styles.dart';
import 'delete_account_button.dart';
import 'language_button.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.settings.tr(),
          style: AppStyles.styleInterBold20(context),
        ),
        const Gap(18),
        const LanguageButton(),
        const Gap(25),
        const DeleteAccountButton(),
        const Gap(25),
        const SignOutButton()
      ],
    );
  }
}

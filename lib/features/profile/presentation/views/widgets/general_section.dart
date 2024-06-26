import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/profile/presentation/views/widgets/profile_text_button.dart';

import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/app_assets.dart';
import '../../../../../core/utlis/styles.dart';
import 'personal_details_button.dart';

class GeneralSection extends StatelessWidget {
  const GeneralSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.General.tr(),
          style: AppStyles.styleInterBold20(context),
        ),
        const Gap(15),
        const PersonalDetailsButton(),
        const Gap(25),
        ProfileTextButton(
            data: LocaleKeys.password_and_security.tr(),
            assetName: Assets.imagesIconsPasswordAndSecurityIcon),
        const Gap(25),
        ProfileTextButton(
          data: LocaleKeys.your_Wallet.tr(),
          assetName: Assets.imagesIconsWalletIcon,
        ),
      ],
    );
  }
}

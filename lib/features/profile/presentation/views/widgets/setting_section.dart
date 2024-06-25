import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/features/profile/presentation/views/widgets/profile_text_button.dart';
import 'package:tourista/features/profile/presentation/views/widgets/sign_out_button.dart';

import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/app_assets.dart';
import '../../../../../core/utlis/styles.dart';

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
        ProfileTextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kLanguageView);
          },
          width: 23,
          height: 23,
          data: LocaleKeys.Language.tr(),
          assetName: Assets.imagesIconsLanguageIcon,
        ),
        const Gap(25),
        ProfileTextButton(
            width: 23,
            height: 23,
            data: LocaleKeys.Delete_Account.tr(),
            assetName: Assets.imagesIconsDeleteAccountIcon),
        const Gap(25),
        const SignOutButton()
      ],
    );
  }
}

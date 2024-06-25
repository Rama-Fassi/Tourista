import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/profile/presentation/views/widgets/profile_text_button.dart';

import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/app_assets.dart';
import '../../../../../core/utlis/styles.dart';

class HelpAndSupportSection extends StatelessWidget {
  const HelpAndSupportSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.Help_and_support.tr(),
          style: AppStyles.styleInterBold20(context),
        ),
        const Gap(18),
        ProfileTextButton(
          width: 27,
          height: 27,
          data: LocaleKeys.Customer_Support.tr(),
          assetName: Assets.imagesIconsCustomerSupportIcon,
        ),
        const Gap(25),
        ProfileTextButton(
            width: 27,
            height: 27,
            data: LocaleKeys.Reviews.tr(),
            assetName: Assets.imagesIconsCarbonStarReviewIcon),
        const Gap(25),
        ProfileTextButton(
          width: 27,
          height: 27,
          data: LocaleKeys.About_us.tr(),
          assetName: Assets.imagesIconsAboutCircleIcon,
        ),
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';

class ReadyTripsSortBy extends StatelessWidget {
  const ReadyTripsSortBy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Text(LocaleKeys.sort.tr()),
        const Gap(2),
        SvgPicture.asset(Assets.imagesIconsSortDown)
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:tourista/features/profile/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/app_assets.dart';
import '../../../../../core/utlis/app_router.dart';
import 'profile_text_button.dart';

class PersonalDetailsButton extends StatelessWidget {
  const PersonalDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileTextButton(
      onPressed: () {
        GoRouter.of(context).push(AppRouter.kPersonalDetailsView);
      },
      data: LocaleKeys.personal_details.tr(),
      assetName: Assets.imagesIconsProfilePerosnIcon,
    );
  }
}

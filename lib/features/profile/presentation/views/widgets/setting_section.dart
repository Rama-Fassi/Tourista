import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/features/profile/presentation/manager/delete_account_cubit/delete_account_cubit.dart';
import 'package:tourista/features/profile/presentation/views/widgets/profile_text_button.dart';
import 'package:tourista/features/profile/presentation/views/widgets/sign_out_button.dart';

import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/app_assets.dart';
import '../../../../../core/utlis/functions/custom_snack_bar.dart';
import '../../../../../core/utlis/styles.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../auth/sign_in_and_up/presentation/manager/sign_out_cubit/sign_out_cubit.dart';
import '../functions/show_confirmation_dialog.dart';
import '../language_view.dart';
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

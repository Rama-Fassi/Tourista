import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/features/profile/presentation/views/functions/show_confirmation_dialog.dart';

import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/app_assets.dart';
import '../../../../../core/utlis/app_router.dart';
import '../../../../../core/utlis/styles.dart';
import '../../../../auth/sign_in_and_up/presentation/manager/sign_out_cubit/sign_out_cubit.dart';
import 'profile_text_button.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileTextButton(
      onPressed: () async {
        ShowConfirmationDialog().showConfirmationDialog(context);
      },
      width: 23,
      height: 23,
      data: LocaleKeys.Sign_out.tr(),
      assetName: Assets.imagesIconsSignOutIcon,
      textStyle: AppStyles.styleInterRegular18(context).copyWith(
        color: Colors.red,
      ),
      iconColor: Colors.red,
    );
  }
}

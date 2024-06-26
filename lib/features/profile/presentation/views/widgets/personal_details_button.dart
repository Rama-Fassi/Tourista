import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/features/profile/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/app_assets.dart';
import '../../../../../core/utlis/app_router.dart';
import 'profile_text_button.dart';

class PersonalDetailsButton extends StatelessWidget {
  const PersonalDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserInfoCubit, GetUserInfoState>(
      listener: (context, state) {
        if (state is GetUserInfoSuccess) {
          GoRouter.of(context)
              .push(AppRouter.kPersonalDetailsView, extra: state.userInfoModel);
        }
      },
      builder: (context, state) {
        return ProfileTextButton(
          onPressed: () {
            BlocProvider.of<GetUserInfoCubit>(context).getUserInfo();
          },
          data: LocaleKeys.personal_details.tr(),
          assetName: Assets.imagesIconsProfilePerosnIcon,
        );
      },
    );
  }
}

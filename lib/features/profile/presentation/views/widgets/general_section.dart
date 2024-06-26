import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/profile/presentation/views/widgets/profile_text_button.dart';

import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/app_assets.dart';
import '../../../../../core/utlis/service_locator.dart';
import '../../../../../core/utlis/styles.dart';
import '../../../data/repos/profile_repo_impl.dart';
import '../../manager/update_name_cubit/update_name_cubit.dart';
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
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  UpdateNameCubit(getIt.get<ProfileRepoImpl>()),
            ),
          ],
          child: const PersonalDetailsButton(),
        ),
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

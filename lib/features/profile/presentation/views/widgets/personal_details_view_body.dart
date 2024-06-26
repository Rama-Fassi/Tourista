import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/profile/presentation/views/widgets/edit_name_row.dart';

import '../../../data/models/user_info_model/user_info_model.dart';
import 'edit_phone_row.dart';

class PersonalDetailsViewBody extends StatelessWidget {
  const PersonalDetailsViewBody(
      {super.key, required this.scereenWidth, required this.userInfoModel});
  final double scereenWidth;
  final UserInfoModel userInfoModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(10),
        Text(
          'Full Name',
          style: AppStyles.styleInterBold20(context),
        ),
        const Gap(20),
        EditNameRow(
          scereenWidth: scereenWidth,
          username: userInfoModel.user!.name ?? '',
        ),
        const Gap(20),
        Text(
          'Phone Number',
          style: AppStyles.styleInterBold20(context),
        ),
        const Gap(20),
        EditPhoneRow(scereenWidth: scereenWidth),
      ],
    );
  }
}

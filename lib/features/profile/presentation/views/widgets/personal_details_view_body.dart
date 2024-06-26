import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/profile/presentation/views/widgets/edit_name_row.dart';

import 'edit_phone_row.dart';

class PersonalDetailsViewBody extends StatelessWidget {
  const PersonalDetailsViewBody({super.key, required this.scereenWidth});
  final double scereenWidth;

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
        EditNameRow(scereenWidth: scereenWidth),
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

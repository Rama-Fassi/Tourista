
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/add_activities_button.dart';

class AddActivitesWithDateColumn extends StatelessWidget {
  const AddActivitesWithDateColumn({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(20),
        Text(
          'Fri,26 April Dubai',
          style: AppStyles.styleInterSemiBold20(context),
          textAlign: TextAlign.start,
        ),
        const Gap(20),
        AddActivitiesButton(screenWidth: screenWidth),
        const Gap(20)
      ],
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/add_activities_button.dart';

class AddActivitiesColumn extends StatelessWidget {
  const AddActivitiesColumn({
    super.key,
    required this.screenWidth,
    required this.data,
  });

  final double screenWidth;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            data,
            style: AppStyles.styleInterSemiBold20(context),
            textAlign: TextAlign.start,
          ),
        ),
        const Gap(20),
        Align(
            alignment: Alignment.center,
            child: AddActivitiesButton(screenWidth: screenWidth)),
        const Gap(20)
      ],
    );
  }
}

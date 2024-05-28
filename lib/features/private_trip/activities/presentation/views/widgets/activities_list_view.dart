import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/utlis/styles.dart';
import 'custom_activity_card.dart';

class ActivitiesListView extends StatelessWidget {
  const ActivitiesListView({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(15),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Select Three activities at most:',
              style: AppStyles.styleSourceSemiBold22(context),
            ),
          ),
          const Gap(20),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CustomActivityCard(
                    screenWidth: screenWidth);
              },
              itemCount: 10,
            ),
          ),
        ]);
  }
}

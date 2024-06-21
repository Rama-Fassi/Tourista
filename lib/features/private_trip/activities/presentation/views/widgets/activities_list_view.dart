import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/private_trip/activities/data/models/tourism_activities/tourism_activities_model.dart';

import '../../../../../../core/utlis/styles.dart';
import 'custom_activity_card.dart';

class ActivitiesListView extends StatelessWidget {
  const ActivitiesListView({
    super.key,
    required this.screenWidth,
    required this.tourismActivitiesModel,
    required this.dayIndex, required this.dayDate,
  });

  final double screenWidth;
  final TourismActivitiesModel tourismActivitiesModel;
  final int dayIndex;
  final String dayDate;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          // physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return CustomActivityCard(
              dayDate:dayDate,
              screenWidth: screenWidth,
              activityName: tourismActivitiesModel.activities![index].name,
              activityDescription:
                  tourismActivitiesModel.activities![index].description,
              activityImages:
                  tourismActivitiesModel.activities![index].images![0],
              activityModel: tourismActivitiesModel.activities![index],
              dayIndex: dayIndex,
            );
          },
          itemCount: tourismActivitiesModel.activities!.length,
        ),
      ),
      //   const Gap(70)
    ]);
  }
}
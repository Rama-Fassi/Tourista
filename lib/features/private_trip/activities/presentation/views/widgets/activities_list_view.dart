import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/private_trip/activities/presentation/manager/activities_cubit/activities_cubit.dart';

import '../../../../../../core/utlis/styles.dart';
import 'custom_activity_card.dart';
import 'custom_shimmer_activity.dart';

class ActivitiesListView extends StatelessWidget {
  const ActivitiesListView({
    super.key,
    required this.screenWidth,
    required this.tripId,
    required this.tourismTybe,
  });
  final String tourismTybe;
  final double screenWidth;
  final int tripId;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    BlocProvider.of<ActivitiesCubit>(context)
        .getTourismPlaces(tourismTybe: tourismTybe, tripId: tripId);

    return BlocBuilder<ActivitiesCubit, ActivitiesState>(
      builder: (context, state) {
        if (state is ActivitiesSuccess) {
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
                    // physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CustomActivityCard(
                        screenWidth: screenWidth,
                        activityName: state
                            .tourismActivitiesModel.activities![index].name,
                        activityDescription: state.tourismActivitiesModel
                            .activities![index].description,
                        activityImages: state.tourismActivitiesModel
                            .activities![index].images![0],
                        activityModel:
                            state.tourismActivitiesModel.activities![index],
                      );
                    },
                    itemCount: state.tourismActivitiesModel.activities!.length,
                  ),
                ),
                const Gap(70)
              ]);
        } else if (state is ActivitiesFailure) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                state.errMessage,
                style: AppStyles.styleSourceRegular20(context),
              ),
            ),
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              return CustomShimmerActivity(
                  screenWidth: screenWidth, height: height);
            },
            itemCount: 10,
          );
        }
      },
    );
  }
}

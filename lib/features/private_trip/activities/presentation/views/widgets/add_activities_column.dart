import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/add_activities_button.dart';
import '../../../../main/data/models/create_trip_model/create_trip_model.dart';
import '../../manager/activity_card_cubit/activity_card_cubit.dart';

class AddActivitiesColumn extends StatefulWidget {
  const AddActivitiesColumn({
    super.key,
    required this.screenWidth,
    required this.data,
    required this.createTripModel,
    required this.tripId,
    required this.index,
  });
  final CreateTripModel createTripModel;
  final int tripId;
  final double screenWidth;
  final String data;
  final int index;

  @override
  State<AddActivitiesColumn> createState() => _AddActivitiesColumnState();
}

class _AddActivitiesColumnState extends State<AddActivitiesColumn> {
  Map<String, dynamic> activitiesPlan = {"planes": []};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.data,
            style: AppStyles.styleInterSemiBold20(context),
            textAlign: TextAlign.start,
          ),
        ),
        const Gap(20),
        BlocBuilder<ActivityCardCubit, ActivityCardState>(
          builder: (context, state) {
            // Clear the activitiesPlan map before updating
            activitiesPlan = {"planes": []};

            if (state.activitiesCardData != null) {
              state.activitiesCardData?.forEach((tripDayId, activities) {
                activitiesPlan['planes'].add({
                  "tripDay_id": tripDayId + 1,
                  "places":
                      activities.map((activity) => activity['id']).toList(),
                });
              });
            }
         
            // Check if there are activities for the current day index
            final activitiesForDay = state.activitiesCardData?[widget.index];
            //  print(state.activitiesCardData?[widget.index].toString());
            print(activitiesPlan.toString());

            return activitiesForDay == null || activitiesForDay.isEmpty
                ? Align(
                    alignment: Alignment.center,
                    child: AddActivitiesButton(
                      index: widget.index,
                      screenWidth: widget.screenWidth,
                      tripId: widget.tripId,
                    ))
                : Column(
                    children: activitiesForDay.map<Widget>((activity) {
                      return Card(
                        child: ListTile(
                          title: Text(activity['name']),
                          subtitle: Text(activity['description']),
                        ),
                      );
                    }).toList(),
                  );
          },
        ),
       
        const Gap(20)
      ],
    );
  }
}

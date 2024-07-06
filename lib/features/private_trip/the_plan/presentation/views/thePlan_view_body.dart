import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/add_activities_list_view.dart';
import 'package:tourista/features/private_trip/main/data/models/create_trip_model/create_trip_model.dart';

class ThePlanViewBody extends StatelessWidget {
  const ThePlanViewBody({super.key, required this.createTripModel});
  final CreateTripModel createTripModel;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 30,
            width: screenWidth,
            color: kPrimaryColor,
            child: Center(
              child: Text(
                'The Activities',
                style: AppStyles.styleInterSemiBold20(context)
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: AddActivitiesListView(
              screenWidth: screenWidth, createTripModel: createTripModel),
        ),
      ],
    );
  }
}

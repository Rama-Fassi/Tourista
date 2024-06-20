import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/add_activities_list_view.dart';
import '../../../main/data/models/create_trip_model/create_trip_model.dart';

class AddActivitiesViewBody extends StatelessWidget {
  const AddActivitiesViewBody({
    super.key,
    required this.createTripModel,
  });
  final CreateTripModel createTripModel;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return AddActivitiesListView(
      screenWidth: screenWidth,
      createTripModel: createTripModel,
    );
  }
}

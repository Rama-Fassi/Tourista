import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/add_activities_view_body.dart';

class AddActivitiesView extends StatelessWidget {
  const AddActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: AddActivitiesViewBody(),
    ));
  }
}

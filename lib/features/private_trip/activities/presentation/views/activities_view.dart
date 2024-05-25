import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/activities_view_body.dart';

class ActivitiesView extends StatelessWidget {
  const ActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: ActivitiesViewBody(),
    ));
  }
}

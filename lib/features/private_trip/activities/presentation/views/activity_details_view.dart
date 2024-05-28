import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/activity_details_view_body.dart';

class ActivityDetails extends StatelessWidget {
  const ActivityDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      body: ActivityDetailsViewBody(),
    ),);
  }
}
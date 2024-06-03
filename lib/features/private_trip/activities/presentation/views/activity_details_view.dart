import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/activity_details_view_body.dart';

import '../../data/models/tourism_activities/activity_model.dart';

class ActivityDetails extends StatelessWidget {
  const ActivityDetails({super.key, required this.activityModel});
  final ActivityModel activityModel;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: ActivityDetailsViewBody(activityModel: activityModel,),
    ),);
  }
}
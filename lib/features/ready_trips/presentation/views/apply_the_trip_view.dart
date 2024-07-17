import 'package:flutter/material.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/apply_the_trip_view_body.dart';

class ApplyTheTripView extends StatelessWidget {
  const ApplyTheTripView({super.key, required this.tripId});
  final int tripId;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ApplyTheTripViewBody(
          tripId: tripId,
        ),
      ),
    );
  }
}

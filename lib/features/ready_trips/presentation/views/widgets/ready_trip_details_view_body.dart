import 'package:flutter/material.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trip_details_list_view.dart';

class ReadyTripDetailsViewBody extends StatelessWidget {
  const ReadyTripDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
      child: ReadyTripDetailsListView(),
    );
  }
}

import 'package:flutter/widgets.dart';

import 'activities_list_view.dart';
import 'add_to_plan_button.dart';

class TabBarViewForActivitiesTybe extends StatelessWidget {
  const TabBarViewForActivitiesTybe({
    super.key,
    required this.screenWidth,
    required this.tripId,
    required this.tourismTybe,
  });

  final double screenWidth;
  final int tripId;
  final String tourismTybe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ActivitiesListView(
          screenWidth: screenWidth,
          tripId: tripId,
          tourismTybe: tourismTybe,
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: AddToPlanButton(screenWidth: screenWidth, onTap: () {}))
      ],
    );
  }
}

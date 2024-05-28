import 'package:flutter/material.dart';
import 'widgets/activities_view_body.dart';

class ActivitiesView extends StatelessWidget {
  const ActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: DefaultTabController(
        length: 6,
        child: ActivitiesViewScaffold(screenWidth: screenWidth),
      ),
    );
  }
}


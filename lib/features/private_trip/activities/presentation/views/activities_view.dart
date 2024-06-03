import 'package:flutter/material.dart';
import 'widgets/custom_colorful_tabBar.dart';
import 'widgets/custom_search_text_field.dart';
import 'widgets/tapbar_view_activities_tybe.dart';

class ActivitiesView extends StatelessWidget {
  const ActivitiesView({super.key, required this.tripId});

  final int tripId;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: DefaultTabController(
        length: 6,
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.95),
          appBar: AppBar(
            leadingWidth: 30,
            titleSpacing: 20,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            toolbarHeight: 100,
            title: const SizedBox(
              height: 55,
              child: CustomSearchTextField(),
            ),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: CustomColorfulTabBar(),
            ),
          ),
          body: TabBarView(
            children: [
              //General
              TabBarViewForActivitiesTybe(
                  screenWidth: screenWidth, tripId: tripId, tourismTybe: ''),
              //Sports
              TabBarViewForActivitiesTybe(
                  screenWidth: screenWidth,
                  tripId: tripId,
                  tourismTybe: 'Sports'),
              //Entertainment
              TabBarViewForActivitiesTybe(
                  screenWidth: screenWidth,
                  tripId: tripId,
                  tourismTybe: 'Entertainment'),
              //Culitural
              TabBarViewForActivitiesTybe(
                  screenWidth: screenWidth,
                  tripId: tripId,
                  tourismTybe: 'Culitural'),
              //Natural
              TabBarViewForActivitiesTybe(
                  screenWidth: screenWidth,
                  tripId: tripId,
                  tourismTybe: 'Natural'),
              //Relaxation
              TabBarViewForActivitiesTybe(
                  screenWidth: screenWidth,
                  tripId: tripId,
                  tourismTybe: 'Relaxation'),
            ],
          ),
        ),
      ),
    );
  }
}

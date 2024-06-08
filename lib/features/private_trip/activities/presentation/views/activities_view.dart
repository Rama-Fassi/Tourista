import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/features/private_trip/activities/presentation/manager/activity_card_cubit/activity_card_cubit.dart';
import 'widgets/custom_colorful_tabBar.dart';
import 'widgets/custom_search_text_field.dart';
import 'widgets/activities_tabbar_view.dart';

class ActivitiesView extends StatelessWidget {
   const ActivitiesView({super.key, required this.activitiesdaysInfo });
   final Map<String ,dynamic> activitiesdaysInfo ;
   
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
              ActivitiesTabBarView(
                  screenWidth: screenWidth, tripId: activitiesdaysInfo['tripId'], tourismTybe: '', dayIndex:  activitiesdaysInfo['index'],),
              //Sports
              ActivitiesTabBarView(
                  screenWidth: screenWidth,
                  tripId: activitiesdaysInfo['tripId'],
                  tourismTybe: 'Sports', dayIndex: activitiesdaysInfo['index'],),
              //Entertainment
              ActivitiesTabBarView(
                  screenWidth: screenWidth,
                  tripId: activitiesdaysInfo['tripId'],
                  tourismTybe: 'Entertainment', dayIndex: activitiesdaysInfo['index'],),
              //Culitural
              ActivitiesTabBarView(
                  screenWidth: screenWidth,
                  tripId: activitiesdaysInfo['tripId'],
                  tourismTybe: 'Culitural', dayIndex: activitiesdaysInfo['index'],),
              //Natural
              ActivitiesTabBarView(
                  screenWidth: screenWidth,
                  tripId: activitiesdaysInfo['tripId'],
                  tourismTybe: 'Natural', dayIndex: activitiesdaysInfo['index'],),
              //Relaxation
              ActivitiesTabBarView(
                  screenWidth: screenWidth,
                  tripId: activitiesdaysInfo['tripId'],
                  tourismTybe: 'Relaxation', dayIndex: activitiesdaysInfo['index'],),
            ],
          ),
        ),
      ),
    );
  }
}

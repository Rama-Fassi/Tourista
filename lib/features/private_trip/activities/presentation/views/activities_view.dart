import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/features/private_trip/activities/presentation/manager/search_activity_cubit/search_activity_cubit.dart';
import 'widgets/activity_search_result_tabbar_view.dart';
import 'widgets/custom_colorful_tabBar.dart';
import 'widgets/custom_search_text_field.dart';
import 'widgets/activities_tabbar_view.dart';

class ActivitiesView extends StatefulWidget {
  const ActivitiesView({super.key, required this.activitiesdaysInfo});
  final Map<String, dynamic> activitiesdaysInfo;

  @override
  State<ActivitiesView> createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String search = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
    //_tabController.index = 0;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    print('activitiesdaysInfo: ${widget.activitiesdaysInfo.toString()}');

    return SafeArea(
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
          title: SizedBox(
            height: 55,
            child: CustomSearchTextField(
              onChanged: (value) {
                search = value;
                print(search);
                setState(() {
                  BlocProvider.of<SearchActivityCubit>(context).searchActivity(
                    search: search,
                    tripId: widget.activitiesdaysInfo['tripId'],
                  );
                  _tabController.index = 0;
                });
              },
              onSubmitted: (value) {
                search = value;
                print(search);
                setState(() {
                  BlocProvider.of<SearchActivityCubit>(context).searchActivity(
                    search: search,
                    tripId: widget.activitiesdaysInfo['tripId'],
                  );
                  _tabController.index = 0;
                });
              },
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: CustomColorfulTabBar(
              controller: _tabController,
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            //General
            BlocBuilder<SearchActivityCubit, SearchActivityState>(
              builder: (context, state) {
                return state is SearchActivitySuccess
                    ? ActivitiesSearchResultTabBarView(
                        screenWidth: screenWidth,
                        tripId: widget.activitiesdaysInfo['tripId'],
                        dayId: widget.activitiesdaysInfo['dayId'],
                        dayDate: widget.activitiesdaysInfo['dayDate'],
                      )
                    : ActivitiesTabBarView(
                        screenWidth: screenWidth,
                        tripId: widget.activitiesdaysInfo['tripId'],
                        tourismTybe: '',
                        dayId: widget.activitiesdaysInfo['dayId'],
                        dayDate: widget.activitiesdaysInfo['dayDate'],
                      );
              },
            ),
            //Sports
            ActivitiesTabBarView(
              screenWidth: screenWidth,
              tripId: widget.activitiesdaysInfo['tripId'],
              tourismTybe: 'Sports',
              dayId: widget.activitiesdaysInfo['dayId'],
              dayDate: widget.activitiesdaysInfo['dayDate'],
            ),
            //Restaurants
            ActivitiesTabBarView(
              screenWidth: screenWidth,
              tripId: widget.activitiesdaysInfo['tripId'],
              tourismTybe: 'Restaurants',
              dayId: widget.activitiesdaysInfo['dayId'],
              dayDate: widget.activitiesdaysInfo['dayDate'],
            ),
            //Entertainment
            ActivitiesTabBarView(
              screenWidth: screenWidth,
              tripId: widget.activitiesdaysInfo['tripId'],
              tourismTybe: 'Entertainment',
              dayId: widget.activitiesdaysInfo['dayId'],
              dayDate: widget.activitiesdaysInfo['dayDate'],
            ),
            //Cultural
            ActivitiesTabBarView(
              screenWidth: screenWidth,
              tripId: widget.activitiesdaysInfo['tripId'],
              tourismTybe: 'Culitural',
              dayId: widget.activitiesdaysInfo['dayId'],
              dayDate: widget.activitiesdaysInfo['dayDate'],
            ),
            //Natural
            ActivitiesTabBarView(
              screenWidth: screenWidth,
              tripId: widget.activitiesdaysInfo['tripId'],
              tourismTybe: 'Natural',
              dayId: widget.activitiesdaysInfo['dayId'],
              dayDate: widget.activitiesdaysInfo['dayDate'],
            ),
            //Relaxation
            ActivitiesTabBarView(
              screenWidth: screenWidth,
              tripId: widget.activitiesdaysInfo['tripId'],
              tourismTybe: 'Relaxation',
              dayId: widget.activitiesdaysInfo['dayId'],
              dayDate: widget.activitiesdaysInfo['dayDate'],
            ),
          ],
        ),
      ),
    );
  }
}

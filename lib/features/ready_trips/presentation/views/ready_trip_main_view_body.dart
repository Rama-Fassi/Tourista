import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trips_app_bar.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trips_tab_bar.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trips_tab_bar_view.dart';

class ReadyTripMainViewBody extends StatefulWidget {
  const ReadyTripMainViewBody({super.key});

  @override
  State<ReadyTripMainViewBody> createState() => _ReadyTripMainViewBodyState();
}

class _ReadyTripMainViewBodyState extends State<ReadyTripMainViewBody>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ReadyTripsAppBar(),
        ),
        ReadyTripsTabBar(tabController: tabController),
        Expanded(
          child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: tabController,
              children: List.generate(
                5,
                (index) => ReadyTripsTabBarView(),
              )),
        )
      ],
    );
  }
}

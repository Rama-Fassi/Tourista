import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class ReadyTripsTabBar extends StatelessWidget {
  const ReadyTripsTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: TabBar(
          onTap: (value) {
            print(value);
          },
          overlayColor: const MaterialStatePropertyAll(Colors.white),
          labelColor: Colors.black,
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          labelStyle: AppStyles.styleSourceSemiBold22(context),
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.black,
          controller: tabController,
          tabs: const [
            Tab(
              text: 'General',
            ),
            Tab(
              text: 'Mountain',
            ),
            Tab(
              text: 'Jungle',
            ),
            Tab(
              text: 'Beach',
            ),
            Tab(
              text: 'Water',
            )
          ]),
    );
  }
}

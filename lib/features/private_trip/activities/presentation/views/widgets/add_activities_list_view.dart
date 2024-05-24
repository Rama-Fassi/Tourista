import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import 'add_activities_column.dart';

class AddActivitiesListView extends StatelessWidget {
  const AddActivitiesListView({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return AddActivitesWithDateColumn(screenWidth: screenWidth);
                },
                itemCount: 5,
              )),
        ),
        const Gap(80)
      ],
    );
  }
}

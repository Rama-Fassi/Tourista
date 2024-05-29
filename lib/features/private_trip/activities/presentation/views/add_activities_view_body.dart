import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/add_to_plan_button.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/add_activities_list_view.dart';

class AddActivitiesViewBody extends StatelessWidget {
  const AddActivitiesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AddActivitiesListView(screenWidth: screenWidth),
        AddToPlanButton(
          screenWidth: screenWidth,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kActivitiesView);
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utlis/styles.dart';
import '../../../../../../core/widgets/add_to_plan_button.dart';
import '../../manager/activities_cubit/activities_cubit.dart';
import 'activities_list_view.dart';
import 'custom_shimmer_activity.dart';

class ActivitiesTabBarView extends StatelessWidget {
  const ActivitiesTabBarView({
    super.key,
    required this.screenWidth,
    required this.tripId,
    required this.tourismTybe,
    required this.dayIndex,
  });

  final double screenWidth;
  final int tripId;
  final String tourismTybe;
  final int dayIndex;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    BlocProvider.of<ActivitiesCubit>(context)
        .getTourismPlaces(tourismTybe: tourismTybe, tripId: tripId);

    return BlocBuilder<ActivitiesCubit, ActivitiesState>(
      builder: (context, state) {
        if (state is ActivitiesSuccess) {
          return Stack(children: [
            ActivitiesListView(
              dayIndex: dayIndex,
              screenWidth: screenWidth,
              tourismActivitiesModel: state.tourismActivitiesModel,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: AddToPlanButton(
                screenWidth: screenWidth,
                onTap: () {},
                text: 'Add',
              ),
            )
          ]);
        } else if (state is ActivitiesFailure) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                state.errMessage,
                style: AppStyles.styleSourceSemiBold22(context),
              ),
            ),
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              return CustomShimmerActivity(
                  screenWidth: screenWidth, height: height);
            },
            itemCount: 10,
          );
        }
      },
    );
  }
}

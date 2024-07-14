import 'package:flutter/cupertino.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/date_text.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/display_activities_list_view.dart';

class DisplayAllActivities extends StatelessWidget {
  const DisplayAllActivities({
    super.key,
    required this.theDateString,
    required this.isEmpty,
    required this.state,
    required this.index,
  });

  final String? theDateString;
  final bool isEmpty;
  final GetUserPrivatePlanSuccess state;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, top: 15),
          child: DateText(
            theDateString: theDateString!,
          ),
        ),
        isEmpty == false
            ? DisplayActivitiesListView(
                state: state,
                index: index,
              )
            : Text(
                'There is No Activities in this day',
                style: AppStyles.styleInterRegular18(context),
              ),
      ],
    );
  }
}

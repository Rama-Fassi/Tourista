import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/widgets/add_to_plan_button.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import '../../../../../../constants.dart';
import '../../../../main/data/models/create_trip_model/create_trip_model.dart';
import '../../manager/activities_plan_cubit/activities_plan_cubit.dart';
import '../../manager/activity_card_cubit/activity_card_cubit.dart';
import 'add_activities_button.dart';
import 'custom_added_activity_card.dart';
import 'days_date_text.dart';

class AddActivitiesListView extends StatefulWidget {
  const AddActivitiesListView({
    super.key,
    required this.screenWidth,
    required this.createTripModel,
  });
  final CreateTripModel createTripModel;

  final double screenWidth;

  @override
  State<AddActivitiesListView> createState() => _AddActivitiesListViewState();
}

class _AddActivitiesListViewState extends State<AddActivitiesListView> {
  String? _startDateString;
  DateTime _startDate = DateTime.now();
  String? _endDateString;
  DateTime _endDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _startDateString = widget.createTripModel.tripId!.dateOfTrip;
    _endDateString = widget.createTripModel.tripId!.dateEndOfTrip;
    _parseDate();
  }

  void _parseDate() {
    _startDate = DateFormat('yyyy-MM-dd').parse(_startDateString!);
    _endDate = DateFormat('yyyy-MM-dd').parse(_endDateString!);
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> dateTimes = List.generate(
      (_endDate.difference(_startDate).inDays + 1),
      (i) => _startDate.add(Duration(days: i)),
    );

    Map<String, dynamic> activitiesPlan = {"planes": []};

    return Stack(alignment: Alignment.bottomCenter, children: [
      Column(
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        const Gap(20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child:
                              DaysDateText(dateTimes: dateTimes, index: index),
                        ),
                        const Gap(20),
                        BlocBuilder<ActivityCardCubit, ActivityCardState>(
                          builder: (context, state) {
                            activitiesPlan = {"planes": []};

                            if (state.activitiesCardData != null) {
                              state.activitiesCardData
                                  ?.forEach((tripDayId, activities) {
                                activitiesPlan['planes'].add({
                                  "tripDay_id": tripDayId + 1,
                                  "places": activities
                                      .map((activity) => activity['id'])
                                      .toList(),
                                });
                              });
                            }

                            // Check if there are activities for the current day index
                            final activitiesForDay =
                                state.activitiesCardData?[index];
                            //  print(state.activitiesCardData?[widget.index].toString());
                            print(activitiesPlan.toString());

                            return activitiesForDay == null ||
                                    activitiesForDay.isEmpty
                                ? Align(
                                    alignment: Alignment.center,
                                    child: AddActivitiesButton(
                                      index: index,
                                      screenWidth: widget.screenWidth,
                                      tripId: widget.createTripModel.tripId!.id,
                                      dayDate: DateFormat('EEEE d MMMM ')
                                          .format(dateTimes[index]),
                                    ))
                                : CustomAddedActivityCard(
                                    activitiesForDay: activitiesForDay);
                          },
                        ),
                      ],
                    );
                  },
                  itemCount: dateTimes.length,
                )),
          ),
          const Gap(80)
        ],
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: BlocBuilder<ActivitiesPlanCubit, ActivitiesPlanState>(
          builder: (context, state) {
            if (state is ActivitiesPlanLoading) {
              return const LoadingWidget();
            } else if (state is ActivitiesPlanFailure) {
              return Text(state.errMessage);
            } else if (state is ActivitiesPlanSuccess) {
              return AddToPlanButton(
                screenWidth: widget.screenWidth,
                onTap: () {},
                color: kGreenColor,
                text: LocaleKeys.added.tr(),
              );
            } else {
              return AddToPlanButton(
                screenWidth: widget.screenWidth,
                onTap: () {
                  BlocProvider.of<ActivitiesPlanCubit>(context)
                      .postActivitiesPlan(body: activitiesPlan);
                },
              );
            }
          },
        ),
      ),
    ]);
  }
}

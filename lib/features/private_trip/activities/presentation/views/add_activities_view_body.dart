import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/functions/custom_success_snack_bar.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/features/private_trip/activities/presentation/manager/get_trip_days_cubit/get_trip_days_cubit.dart';
import '../../../../../core/utlis/functions/custom_snack_bar.dart';
import '../../../../../core/widgets/snak_bar_widget.dart';
import '../../../main/data/models/create_trip_model/create_trip_model.dart';
import '../manager/activities_plan_cubit/activities_plan_cubit.dart';
import '../manager/activity_card_cubit/activity_card_cubit.dart';
import 'widgets/activities_button.dart';
import 'widgets/add_activities_button.dart';
import 'widgets/custom_added_activity_card.dart';
import 'widgets/date_text.dart';

class AddActivitiesViewBody extends StatefulWidget {
  const AddActivitiesViewBody({
    super.key,
    required this.createTripModel,
  });
  final CreateTripModel createTripModel;

  @override
  State<AddActivitiesViewBody> createState() => _AddActivitiesViewBodyState();
}

class _AddActivitiesViewBodyState extends State<AddActivitiesViewBody> {
  String? theDateString;
  DateTime theDate = DateTime.now();
  int dayId = 0;
  Map<String, dynamic> activitiesPlan = {"planes": []};

  @override
  void initState() {
    super.initState();
    getTripDays();
  }

  Future<void> getTripDays() async {
    await BlocProvider.of<GetTripDaysCubit>(context)
        .getTripDays(tripId: widget.createTripModel.tripId!.id);
  }

  @override
  Widget build(BuildContext context) {
    print('tripId: ${widget.createTripModel.tripId!.id}'.toString());
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<GetTripDaysCubit, GetTripDaysState>(
      listener: (context, state) {
        if (state is GetTripDaysSuccess) {
          setState(() {
            theDateString = state.getTripDaysModel.days![1].date;
            theDate = DateFormat('yyyy-MM-dd').parse(theDateString!);
            activitiesPlan = {"planes": []};
            activitiesPlan = {"planes": []};
          });
        }
      },
      child: BlocBuilder<GetTripDaysCubit, GetTripDaysState>(
        builder: (context, state) {
          if (state is GetTripDaysSuccess) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        dayId = state.getTripDaysModel.days![index].id!;
                        theDateString =
                            state.getTripDaysModel.days![index].date;
                        return Column(
                          children: [
                            const Gap(20),
                            DateText(theDateString: theDateString!),
                            const Gap(20),
                            BlocBuilder<ActivityCardCubit, ActivityCardState>(
                              builder: (context, state) {
                                activitiesPlan = {"planes": []};

                                if (state.activitiesCardData != null) {
                                  state.activitiesCardData
                                      ?.forEach((dayId, activities) {
                                    activitiesPlan['planes'].add({
                                      "tripDay_id": dayId,
                                      "places": activities
                                          .map((activity) => activity['id'])
                                          .toList(),
                                    });
                                  });
                                }
                                final activitiesForDay =
                                    state.activitiesCardData?[dayId];

                                return activitiesForDay == null ||
                                        activitiesForDay.isEmpty
                                    ? Align(
                                        alignment: Alignment.center,
                                        child: AddActivitiesButton(
                                          dayId: dayId,
                                          screenWidth: screenWidth,
                                          tripId:
                                              widget.createTripModel.tripId!.id,
                                          dayDate: DateFormat('EEEE d MMMM ')
                                              .format(theDate),
                                        ),
                                      )
                                    : CustomAddedActivityCard(
                                        activitiesForDay: activitiesForDay);
                              },
                            ),
                          ],
                        );
                      },
                      itemCount: state.getTripDaysModel.days!.length,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child:
                        BlocConsumer<ActivitiesPlanCubit, ActivitiesPlanState>(
                      listener: (context, state) {
                        if (state is ActivitiesPlanSuccess) {
                          customSuccessSnackBar(context,
                              "Activities Added Successfully to the plan");
                        } else if (state is ActivitiesPlanFailure) {
                          customSnackBar(context, state.errMessage);
                        }
                      },
                      builder: (context, state) {
                        print(activitiesPlan.toString());

                        return BlocBuilder<ActivitiesPlanCubit,
                            ActivitiesPlanState>(
                          builder: (context, state) {
                            if (state is ActivitiesPlanLoading) {
                              return const LoadingWidget();
                            } else {
                              return CustomAddButton(
                                screenWidth: screenWidth,
                                onTap: () {
                                  BlocProvider.of<ActivitiesPlanCubit>(context)
                                      .postActivitiesPlan(body: activitiesPlan);
                                }, theplan: false,
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          } else if (state is GetTripDaysFailure) {
            return SnakBarWidget(message: state.errMessage);
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}

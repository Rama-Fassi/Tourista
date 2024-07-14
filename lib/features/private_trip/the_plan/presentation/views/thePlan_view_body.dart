import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/core/widgets/snak_bar_widget.dart';
import 'package:tourista/features/private_trip/main/data/models/create_trip_model/create_trip_model.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/the_plan_container.dart';

import '../../../../../core/translations/locale_keys.g.dart';
import '../../../../../core/utlis/functions/custom_snack_bar.dart';
import '../../../../profile/presentation/views/functions/show_confirmation_dialog.dart';
import '../../../activities/presentation/views/widgets/activities_button.dart';
import '../manager/final_booking_private_trip/final_booking_private_trip_cubit.dart';
import 'widgets/display_all_activities.dart';
import 'widgets/hotels_list_view.dart';

class ThePlanViewBody extends StatefulWidget {
  const ThePlanViewBody({super.key, required this.createTripModel});
  final CreateTripModel createTripModel;

  @override
  State<ThePlanViewBody> createState() => _ThePlanViewBodyState();
}

class _ThePlanViewBodyState extends State<ThePlanViewBody> {
  String? theDateString;
  DateTime theDate = DateTime.now();
  bool isEmpty = false;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUserPrivatePlanCubit>(context)
        .getUserPrivatePlan(tripId: widget.createTripModel.tripId!.id);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return BlocBuilder<GetUserPrivatePlanCubit, GetUserPrivatePlanState>(
      builder: (context, state) {
        if (state is GetUserPrivatePlanSuccess) {
          return Container(
            color: Colors.grey.shade100,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        //Hotels
                        ThePlanContainer(
                          data: 'The Hotels',
                          screenwidth: screenWidth,
                          child: displayHotelsList(state),
                        ),
                        // Activities
                        ThePlanContainer(
                          data: 'The Activities',
                          screenwidth: screenWidth,
                          child: displayActivitiesList(state),
                        ),
                        Gap(screenHeight * .15),

                        // Button
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(),
              BlocListener<FinalBookingPrivateTripCubit,
                  FinalBookingPrivateTripState>(
                listener: (context, state) {
                  if (state is FinalBookingPrivateTripSuccess) {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  } else if (state is FinalBookingPrivateTripFailure) {
                    customSnackBar(context, state.errMessage);
                  } else {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return const LoadingWidget();
                      },
                    );
                  }
                },
                child: CustomAddButton(
                  finalPrice: state.getUserPrivatePlanModel.finalPrice,
                  screenWidth: screenWidth,
                  screenheight: screenHeight,
                  onTap: () {
                    ShowConfirmationDialog().showConfirmationDialog(
                        context: context,
                        titleText: LocaleKeys.Confirmation.tr(),
                        contentText: 'Are You sure?',
                        onConfirmPressed: () {
                          BlocProvider.of<FinalBookingPrivateTripCubit>(context)
                              .finalBookingPrivateTrip(
                                  tripId: widget.createTripModel.tripId!.id);
                        },
                        cancel: true);
                  },
                  text: 'Submit this trip',
                  theplan: true,
                ),
              )
            ]),
          );
        } else if (state is GetUserPrivatePlanFailure) {
          return SnakBarWidget(
            message: state.errMessage,
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }

  ListView displayActivitiesList(GetUserPrivatePlanSuccess state) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.getUserPrivatePlanModel.tourismPlaces!.length,
      itemBuilder: (context, index) {
        state.getUserPrivatePlanModel.tourismPlaces![index].tripDayPlace!
                .isEmpty
            ? isEmpty = true
            : isEmpty = false;
        theDateString =
            state.getUserPrivatePlanModel.tourismPlaces?[index].date!;
        return DisplayAllActivities(
          theDateString: theDateString,
          isEmpty: isEmpty,
          state: state,
          index: index,
        );
      },
    );
  }

  dynamic displayHotelsList(GetUserPrivatePlanSuccess state) {
    state.getUserPrivatePlanModel.hotels!.isEmpty
        ? isEmpty = true
        : isEmpty = false;
    print(isEmpty.toString());
    return isEmpty == false
        ? HotelsListView(
            state: state,
          )
        : Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              'There is no places to stay in your plan',
              style: AppStyles.styleInterRegular18(context),
            ),
          );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/core/widgets/snak_bar_widget.dart';
import 'package:tourista/features/private_trip/main/data/models/create_trip_model/create_trip_model.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/views/widgets/the_plan_container.dart';
import 'widgets/display_all_activities.dart';
import 'widgets/final_booking_button.dart';
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
                        //Ticket
                        ThePlanContainer(
                            data: 'The Ticket',
                            screenwidth: screenWidth,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text(
                                'there is no ticket ui',
                                style: AppStyles.styleInterRegular18(context),
                              ),
                            )),
                        //Hotels
                        ThePlanContainer(
                          data: 'The Hotels',
                          screenwidth: screenWidth,
                          child: displayHotelsList(state,
                              tripId: widget.createTripModel.tripId!.id,
                              width: screenWidth,
                              height: screenHeight),
                        ),

                        // Activities
                        ThePlanContainer(
                          data: 'The Activities',
                          screenwidth: screenWidth,
                          child: displayActivitiesList(state),
                        ),
                        Gap(screenHeight * .15),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(),
              FinalBookingButton(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                widget: widget,
                finalPrice: state.getUserPrivatePlanModel.finalPrice!,
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

  dynamic displayHotelsList(GetUserPrivatePlanSuccess state,
      {tripId, width, height}) {
    state.getUserPrivatePlanModel.hotels!.isEmpty
        ? isEmpty = true
        : isEmpty = false;
    return isEmpty == false
        ? HotelsListView(
            state: state,
            tripId: tripId,
            height: height,
            width: width,
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

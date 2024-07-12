import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/core/widgets/snak_bar_widget.dart';
import 'package:tourista/features/private_trip/main/data/models/create_trip_model/create_trip_model.dart';
import 'package:tourista/features/private_trip/the_plan/presentation/manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';

import '../../../activities/presentation/views/widgets/date_text.dart';

class ThePlanViewBody extends StatefulWidget {
  const ThePlanViewBody({super.key, required this.createTripModel});
  final CreateTripModel createTripModel;

  @override
  State<ThePlanViewBody> createState() => _ThePlanViewBodyState();
}

class _ThePlanViewBodyState extends State<ThePlanViewBody> {
  String? theDateString;
  DateTime theDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUserPrivatePlanCubit>(context)
        .getUserPrivatePlan(tripId: widget.createTripModel.tripId!.id);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return BlocBuilder<GetUserPrivatePlanCubit, GetUserPrivatePlanState>(
      builder: (context, state) {
        if (state is GetUserPrivatePlanSuccess) {
          print(state.getUserPrivatePlanModel.tourismPlaces![1].toString());
          return ListView.builder(
            itemCount: state.getUserPrivatePlanModel.tourismPlaces!.length,
            itemBuilder: (context, index) {
              theDateString =
                  state.getUserPrivatePlanModel.tourismPlaces?[index].date!;
              theDate = DateFormat('yyyy-MM-dd').parse(theDateString!);
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DateText(
                      theDate: theDate,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.getUserPrivatePlanModel
                          .tourismPlaces![index].tripDayPlace!.length,
                      itemBuilder: (context, activitiesindex) {
                        return Text(
                          '${state.getUserPrivatePlanModel.tourismPlaces![index].tripDayPlace![activitiesindex].tourismPlace!.name}',
                        );
                      },
                    ),
                  ],
                ),
              );
            },
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
}

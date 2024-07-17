import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/core/widgets/err_animation.dart';
import 'package:tourista/features/ready_trips/presentation/manager/all_ready_trips_cubit/all_ready_trips_cubit.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trips_card.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trips_sort_by.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/shimmer_ready_trips_loading.dart';

class ReadyTripsTabBarView extends StatelessWidget {
  const ReadyTripsTabBarView({super.key, required this.value});
  final int value;

  Future<void> _refreshData(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));

    if (value == 0) {
      BlocProvider.of<AllReadyTripsCubit>(context).getAllReadyTripsFun();
    } else {
      BlocProvider.of<AllReadyTripsCubit>(context)
          .getAllReadyTripsFun(classificationId: value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          ReadyTripsSortBy(
            classificationId: value,
          ),
          BlocBuilder<AllReadyTripsCubit, AllReadyTripsState>(
            builder: (context, state) {
              if (state is AllReadyTripsSuccess) {
                if (state.allReadyTripsModel.theTrips == null ||
                    state.allReadyTripsModel.theTrips!.isEmpty) {
                  return ErrAnimation(errMessage: 'There is no trips');
                }
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => _refreshData(context),
                    child: ListView.builder(
                      itemCount: state.allReadyTripsModel.theTrips!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 18),
                          child: ReadyTripsCard(
                            value: value,
                            theTrip: state.allReadyTripsModel.theTrips![index],
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else if (state is AllReadyTripsLoading) {
                return Expanded(
                    child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ShimmerReadyTripsLoading(),
                    );
                  },
                ));
              } else if (state is AllReadyTripsFailure) {
                return ErrAnimation(
                    errMessage: state.errMessage,
                    onPressed: () {
                      if (value == 0) {
                        BlocProvider.of<AllReadyTripsCubit>(context)
                            .getAllReadyTripsFun();
                      } else {
                        BlocProvider.of<AllReadyTripsCubit>(context)
                            .getAllReadyTripsFun(classificationId: value);
                      }
                    });
              } else {
                return ErrAnimation(
                    errMessage: 'Please Try Again ',
                    onPressed: () {
                      if (value == 0) {
                        BlocProvider.of<AllReadyTripsCubit>(context)
                            .getAllReadyTripsFun();
                      } else {
                        BlocProvider.of<AllReadyTripsCubit>(context)
                            .getAllReadyTripsFun(classificationId: value);
                      }
                    });
              }
            },
          )
        ],
      ),
    );
  }
}

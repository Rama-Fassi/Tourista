import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/core/widgets/err_animation.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo_impl.dart';
import 'package:tourista/features/my_trips/presentation/manager/active_trips_cubit/active_trips_cubit.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/empty_trips.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/my_trips_card.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/my_trips_shimmer.dart';

class ActiveBody extends StatelessWidget {
  const ActiveBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ActiveTripsCubit(getIt.get<MyTripsRepoImpl>())..getActiveTripsFun(),
      child: BlocBuilder<ActiveTripsCubit, ActiveTripsState>(
        builder: (context, state) {
          if (state is ActiveTripsLoading) {
            return MyTripsShimmerLoading();
          } else if (state is ActiveTripsSuccess) {
            if (state.allTripsModel.allTrips == null ||
                state.allTripsModel.allTrips!.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: EmptyTrips(
                  desc: 'Go, Book Your Trip And Experience The World With Us!!',
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemCount: state.allTripsModel.allTrips!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: MyTripsCard(
                        allTrip: state.allTripsModel.allTrips![index],
                      ),
                    );
                  },
                ),
              );
            }
          } else if (state is ActiveTripsFailure) {
            return ErrAnimation(
              errMessage: state.errMessage,
              onPressed: () {
                BlocProvider.of<ActiveTripsCubit>(context).getActiveTripsFun();
              },
            );
          } else {
            return ErrAnimation(
              errMessage: 'There is a problem Please try later',
              onPressed: () {
                BlocProvider.of<ActiveTripsCubit>(context).getActiveTripsFun();
              },
            );
          }
        },
      ),
    );
  }
}

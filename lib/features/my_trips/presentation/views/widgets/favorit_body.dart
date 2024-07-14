import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/err_animation.dart';
import 'package:tourista/features/my_trips/data/repos/my_trips_repo_impl.dart';
import 'package:tourista/features/my_trips/presentation/manager/favorit_trips_cubit/favorit_trips_cubit.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/favorit_shimmer.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/my_trips_favorit_card.dart';
import 'package:tourista/features/ready_trips/presentation/manager/ready_trip_details_cubit/ready_trip_details_cubit.dart';

class FavoritBody extends StatelessWidget {
  const FavoritBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FavoritTripsCubit(getIt.get<MyTripsRepoImpl>())..getFavoritTripsFun(),
      child: BlocBuilder<FavoritTripsCubit, FavoritTripsState>(
        builder: (context, state) {
          if (state is FavoritTripsLoading) {
            return FavoritShimmerLoading();
          } else if (state is FavoritTripsSuccess) {
            if (state.favoritTripsModel.yourFavorite == null ||
                state.favoritTripsModel.yourFavorite!.isEmpty) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Where to next?',
                      style: AppStyles.styleInterBold25(context),
                    ),
                    Gap(24),
                    Text(
                      'Add Trips To Your Favorit To Can Book It When You Want!!',
                      style: AppStyles.styleSourceRegular20(context),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  itemCount: state.favoritTripsModel.yourFavorite!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<ReadyTripDetailsCubit>(context)
                            .getReadyTripDetailsFun(
                                tripId: state.favoritTripsModel
                                    .yourFavorite![index].publicTripId!);
                        GoRouter.of(context)
                            .push(AppRouter.kReadyTripDetailsView);
                      },
                      child: MyTripsFavoritCard(
                        publicTrip: state
                            .favoritTripsModel.yourFavorite![index].publicTrip!,
                      ),
                    );
                  },
                ),
              );
            }
          } else if (state is FavoritTripsFailure) {
            return ErrAnimation(
              errMessage: state.errMessage,
              onPressed: () {
                BlocProvider.of<FavoritTripsCubit>(context)
                    .getFavoritTripsFun();
              },
            );
          } else {
            return ErrAnimation(
              errMessage: 'There is a problem Please try later',
              onPressed: () {
                BlocProvider.of<FavoritTripsCubit>(context)
                    .getFavoritTripsFun();
              },
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/fav_ready_trips.dart';

class FavWithPhotoReadyTrips extends StatelessWidget {
  const FavWithPhotoReadyTrips({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(Assets.imagesReadyTripsTest1),
        FavReadyTrips(),
      ],
    );
  }
}

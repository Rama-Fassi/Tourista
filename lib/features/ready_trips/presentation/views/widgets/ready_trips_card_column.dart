import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/fav_with_photo_ready_trips.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/price_and_show_button.dart';

class ReadyTripsCardColumn extends StatelessWidget {
  const ReadyTripsCardColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FavWithPhotoReadyTrips(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Text(
            'To Paris',
            style: AppStyles.styleSourceSemiBold22(context)
                .copyWith(color: kPrimaryColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            'trip to visit paris and see all its beautiful places ',
            style: AppStyles.styleInterMedium18(context),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: PriceAndShowButton(),
        )
      ],
    );
  }
}

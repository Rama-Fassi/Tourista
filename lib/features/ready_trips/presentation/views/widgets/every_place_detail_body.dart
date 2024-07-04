import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/icon_with_text_row.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/places_image_page_view.dart';

class EveryPlaceDetailBody extends StatelessWidget {
  const EveryPlaceDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlacesImagePageView(),
          PlacesTextDesc(),
          Padding(
            padding: const EdgeInsets.all(36),
            child: CustomButton(
                text: 'See on Google Map',
                width: MediaQuery.sizeOf(context).width,
                borderRadius: 24,
                height: 50,
                style: AppStyles.styleSourceBold20(context)
                    .copyWith(color: Colors.white),
                color: kPrimaryColor),
          )
        ],
      ),
    );
  }
}

class PlacesTextDesc extends StatelessWidget {
  const PlacesTextDesc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Moraine lake',
            style: AppStyles.styleQuickBold30(context)
                .copyWith(color: kPrimaryColor),
          ),
          Gap(12),
          IconWithTextRow(
            assetName: Assets.imagesIconsHour,
            data: 'From 9am to 1pm',
            imagePhoto: kGreenColor,
            style: AppStyles.styleQuickBold22(context),
          ),
          Gap(12),
          Text(
              overflow: TextOverflow.ellipsis,
              style: AppStyles.styleInterMedium19(context),
              maxLines: 5,
              'Don\'t miss a visit to one of Banff\'s most popular locations, Moraine Lake. This stunning turquoise gem, cradled by the Valley of the Ten Peaks, is a sight straight out of a dream.')
        ],
      ),
    );
  }
}

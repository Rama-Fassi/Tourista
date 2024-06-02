import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/hotel_main_card_title_and_review_column.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_appbar.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_card_photo.dart';

class StaysViewBody extends StatelessWidget {
  const StaysViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HotelMainAppBar(),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            '366 ${LocaleKeys.properties.tr()}',
            style: AppStyles.styleInterRegular14(context),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HotelMainCardPhoto(width: width),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 18),
              child: Column(
                children: [
                  HotelMainCardTitleAndReviewColumn(width: width),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

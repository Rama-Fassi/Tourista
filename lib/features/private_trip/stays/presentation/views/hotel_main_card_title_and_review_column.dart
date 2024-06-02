import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_card_title.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_review_row.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/stars_main_row.dart';

class HotelMainCardTitleAndReviewColumn extends StatelessWidget {
  const HotelMainCardTitleAndReviewColumn({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HotelMainCardTitle(width: width),
        Gap(4),
        StarsMainRow(),
        Gap(8),
        HotelMainReviewRow()
      ],
    );
  }
}

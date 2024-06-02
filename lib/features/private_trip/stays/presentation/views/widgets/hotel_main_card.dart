import 'package:flutter/cupertino.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/hotel_main_card_title_and_review_column.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_card_photo.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_card_price_and_description.dart';

class HotelMainCard extends StatelessWidget {
  const HotelMainCard({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HotelMainCardPhoto(width: width),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              HotelMainCardTitleAndReviewColumn(width: width),
              HotelMainCardPriceAndDescription(width: width, height: height)
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_card.dart';

class HotelMainListView extends StatelessWidget {
  const HotelMainListView({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 12),
          child: HotelMainCard(width: width, height: height),
        );
      },
    );
  }
}

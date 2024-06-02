import 'package:flutter/cupertino.dart';
import 'package:tourista/core/utlis/styles.dart';

class HotelMainCardTitle extends StatelessWidget {
  const HotelMainCardTitle({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * .6,
      child: Text(
        maxLines: 2,
        'Hotel Boulevard, Autograph Collection',
        style: AppStyles.styleSourceSemiBold20(context),
      ),
    );
  }
}

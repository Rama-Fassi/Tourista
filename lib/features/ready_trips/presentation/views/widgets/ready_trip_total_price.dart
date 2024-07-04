import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class ReadyTripTotalPrice extends StatelessWidget {
  const ReadyTripTotalPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total price ',
          style: AppStyles.styleInterBold25(context),
        ),
        Text(
          '400\$',
          style: AppStyles.styleInterSemiBold20(context).copyWith(fontSize: 20),
        ),
      ],
    );
  }
}

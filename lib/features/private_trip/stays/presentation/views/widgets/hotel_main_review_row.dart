import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';

class HotelMainReviewRow extends StatelessWidget {
  const HotelMainReviewRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          child: Center(
            child: Text(
              '9.4',
              style: AppStyles.styleQuickSemiBold16(context),
            ),
          ),
        ),
        Gap(6),
        Text(
          'Superb',
          style: AppStyles.styleSourceSemiBold18(context),
        )
      ],
    );
  }
}

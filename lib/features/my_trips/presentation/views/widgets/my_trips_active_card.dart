import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

class MyTripsActiveCard extends StatelessWidget {
  const MyTripsActiveCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: AspectRatio(
        aspectRatio: 2 / 1.1,
        child: Container(
          alignment: Alignment.bottomLeft,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(Assets.imagesMytripsTest))),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Croatia',
                  style: AppStyles.styleInterBold25(context)
                      .copyWith(color: Colors.white),
                ),
                Text(
                  'winter 2024 - 14 days',
                  style: AppStyles.styleInterMedium18(context)
                      .copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

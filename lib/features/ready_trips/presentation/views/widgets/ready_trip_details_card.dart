import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';

class ReadyTripDetailsCard extends StatelessWidget {
  const ReadyTripDetailsCard({
    super.key,
    required this.isEnd,
  });
  final bool isEnd;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isEnd
            ? SvgPicture.asset(Assets.imagesReadyTripDetailIcon2)
            : SvgPicture.asset(Assets.imagesReadyTripDetailIcon1),
        Gap(13),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Moraine Lake',
              style: AppStyles.styleQuickBold22(context),
            ),
            Gap(4),
            Text(
              'Lake',
              style: AppStyles.styleSourceBold18(context),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .45,
              child: Text(
                maxLines: 2,
                'one of the wonderful places to visit in this place',
                style: AppStyles.styleQuickSemiBold18(context)
                    .copyWith(color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kEveryPlaceDetail);
              },
              child: Text(
                'see more',
                style: AppStyles.styleQuickSemiBold18(context)
                    .copyWith(color: kPrimaryColor.withOpacity(.7)),
              ),
            )
          ],
        ),
        Gap(13),
        Image.asset(Assets.imagesPlacesTest),
      ],
    );
  }
}

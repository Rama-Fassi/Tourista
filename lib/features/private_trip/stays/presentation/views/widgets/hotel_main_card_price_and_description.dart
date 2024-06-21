import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';

class HotelMainCardPriceAndDescription extends StatelessWidget {
  const HotelMainCardPriceAndDescription({
    super.key,
    required this.width,
    required this.height,
    required this.hotel,
  });
  final Hotel hotel;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: width * .3,
          child: Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            hotel.description!,
            style: AppStyles.styleSourceRegular14(context),
          ),
        ),
        Text(
          LocaleKeys.averagePrice.tr(),
          style: AppStyles.styleSourceSemiBold18(context),
        ),
        Text(
          'US\$${hotel.avarageOfPrice}',
          style: AppStyles.styleSourceBold25(context),
        ),
        const Gap(4),
        CustomButton(
            onTap: () => GoRouter.of(context)
                .push(AppRouter.kHotelDetailsView, extra: hotel),
            text: LocaleKeys.show.tr(),
            width: width * .15,
            borderRadius: 5,
            height: height * .035,
            style: AppStyles.styleSourceBold16(context)
                .copyWith(color: Colors.white),
            color: kPrimaryColor.withOpacity(.8))
      ],
    );
  }
}

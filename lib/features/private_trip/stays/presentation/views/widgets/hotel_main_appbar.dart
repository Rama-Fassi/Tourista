import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotels_main_appbar_card.dart';

class HotelMainAppBar extends StatelessWidget {
  const HotelMainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 4,
              offset: Offset(0, 4),
              color: Colors.grey.withOpacity(.1))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HotelsMainAppBarCard(
            title: LocaleKeys.sort.tr(),
            icon: Assets.imagesIconsSortBy,
          ),
          HotelsMainAppBarCard(
            title: LocaleKeys.map.tr(),
            icon: Assets.imagesIconsGooglemap,
          ),
          HotelsMainAppBarCard(
            title: LocaleKeys.search.tr(),
            icon: Assets.imagesIconsSearch,
          ),
        ],
      ),
    );
  }
}

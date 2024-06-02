import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_appbar.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_list_view.dart';

class StaysViewBody extends StatelessWidget {
  const StaysViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HotelMainAppBar(),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    '366 ${LocaleKeys.properties.tr()}',
                    style: AppStyles.styleInterRegular14(context),
                  ),
                ),
              ),
              HotelMainListView(width: width, height: height),
            ],
          ),
        )
      ],
    );
  }
}

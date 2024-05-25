import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/sort_by_tickets_row.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/tickets_time.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/tickets_view_app_bar.dart';

class TicketsViewBody extends StatelessWidget {
  const TicketsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        TickesViewAppBar(width: width, height: height),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            LocaleKeys.priceMyChange.tr(),
            style: AppStyles.styleInterMedium18(context)
                .copyWith(color: Colors.black.withOpacity(.5)),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          width: width,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [boxShadow(4, 4), boxShadow(-4, 4)]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SortByTicketsRow(),
              TicketsTime(
                time: '17:5',
                airport: "DXB",
                date: '18-5',
              )
            ],
          ),
        )
      ],
    );
  }

  BoxShadow boxShadow(double y, double blur) {
    return BoxShadow(
      color: Colors.grey.withOpacity(.1),
      blurRadius: blur,
      offset: Offset(0, y),
    );
  }
}

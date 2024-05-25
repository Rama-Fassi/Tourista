import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/one_way_ticket.dart';
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
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    LocaleKeys.priceMyChange.tr(),
                    style: AppStyles.styleInterMedium18(context)
                        .copyWith(color: Colors.black.withOpacity(.5)),
                  ),
                ),
              ),
              SliverList.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: OneWayTicket(width: width, height: height),
                    );
                  })
            ],
          ),
        )
      ],
    );
  }
}

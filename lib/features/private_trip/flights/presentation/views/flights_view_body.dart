import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/cabin_class_radio_list_tile.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/flight_way.dart';

import 'package:tourista/features/private_trip/main/presentation/views/widgets/plan-and_plane_table.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/table_row_widget.dart';

class FligtsViewBody extends StatefulWidget {
  const FligtsViewBody({super.key});

  @override
  State<FligtsViewBody> createState() => _FligtsViewBodyState();
}

class _FligtsViewBodyState extends State<FligtsViewBody> {
  String? cabinClass;
  String? flightWay;
  @override
  Widget build(BuildContext context) {
    List<Widget> tableList = [
      FlightsWay(
        onFlightsWayChanged: (value) {
          flightWay = value;
        },
      ),
      Text('data'),
      TableRowWidget(
        padding: 14,
        text: cabinClass == null ? LocaleKeys.cabinClass.tr() : "$cabinClass",
        onTap: () {
          showCabinClass(context);
        },
        image: Assets.imagesIconsCabinClass,
      ),
      CustomButton(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kTicketsView);
          print(flightWay);
        },
        text: LocaleKeys.continueButton.tr(),
        width: MediaQuery.of(context).size.width,
        borderRadius: 10,
        height: MediaQuery.of(context).size.height * .075,
        style: AppStyles.styleInterBold20(context)
            .copyWith(color: Colors.white, fontSize: 20),
        color: kPrimaryColor,
      ),
    ];
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: PlanAndPlaneTable(
        tableList: tableList,
        rowNumber: 4,
      ),
    ));
  }

  Future<dynamic> showCabinClass(BuildContext context) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        context: context,
        builder: (context) {
          return FractionallySizedBox(
            widthFactor: 1,
            heightFactor: .8,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.cabinClass.tr(),
                      style: AppStyles.styleInterBold25(context)
                          .copyWith(color: kPrimaryColor),
                    ),
                    const Gap(10),
                    CabinCalssRadioListTile(
                      onCabinChanged: (String value) {
                        setState(() {
                          cabinClass = value;
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

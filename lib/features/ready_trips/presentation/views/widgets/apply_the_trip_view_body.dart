import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/apply_to_trip_app_bar.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/flights_point_box.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trip_total_price.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/select_ticket_number_box.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/vip_check_box.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/vip_features.dart';

class ApplyTheTripViewBody extends StatelessWidget {
  const ApplyTheTripViewBody({super.key, required this.tripId});
  final int tripId;
  @override
  Widget build(BuildContext context) {
    List<String> features = [
      LocaleKeys.businessClassFlightTicket.tr(),
      LocaleKeys.sweetAndBeautifulView.tr(),
      LocaleKeys.privateTransportation.tr()
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ApplyToTripAppBar(),
          Gap(45),
          Text(
            LocaleKeys.choose_the_closet_point.tr(),
            style: AppStyles.styleInterMedium18(context).copyWith(fontSize: 18),
          ),
          Gap(16),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 4, color: kYellowColor),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FlightsPointBox(
                  tripId: tripId,
                ),
              )),
          Gap(40),
          Text(
            LocaleKeys.selectTicketNumber.tr(),
            style: AppStyles.styleInterMedium18(context).copyWith(fontSize: 18),
          ),
          Gap(20),
          SelectTicketNumberBox(),
          Gap(50),
          Text(
            '${LocaleKeys.vipTicket.tr()}:',
            style: AppStyles.styleSourceBold20(context)
                .copyWith(color: kPrimaryColor, fontSize: 20),
          ),
          Column(
            children: List.generate(
                features.length,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: VIPFeatures(
                        text: features[index],
                      ),
                    )),
          ),
          Gap(8),
          VIPCheckBox(),
          Spacer(),
          Row(
            children: [
              ReadyTripTotalPrice(),
              Spacer(),
              CustomButton(
                  onTap: () {},
                  text: LocaleKeys.confirm.tr(),
                  width: 120,
                  borderRadius: 24,
                  height: 50,
                  style: AppStyles.styleInterBold20(context)
                      .copyWith(color: Colors.white),
                  color: kPrimaryColor),
            ],
          )
        ],
      ),
    );
  }
}

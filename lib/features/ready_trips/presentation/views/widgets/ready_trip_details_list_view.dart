import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/ready_trips/data/models/ready_trips_details_model/ready_trips_details_model.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trip_details_card.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/compact_calendar_widget.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trip_hotel.dart';

class ReadyTripDetailsListView extends StatelessWidget {
  const ReadyTripDetailsListView({
    super.key,
    required this.readyTripsDetailsModel,
  });
  final ReadyTripsDetailsModel readyTripsDetailsModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: CompactCalendarWidget(
          readyTripsDetailsModel: readyTripsDetailsModel,
        )),
        const SliverToBoxAdapter(child: Gap(24)),
        SliverToBoxAdapter(
          child: ReadyTripHotel(
            citiesHotel: readyTripsDetailsModel.publicTrip!.citiesHotel!,
          ),
        ),
        const SliverToBoxAdapter(child: Gap(14)),
        SliverList.builder(
          itemCount: readyTripsDetailsModel.publicTrip!.publicTripPlace!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: ReadyTripDetailsCard(
                tourismPlace: readyTripsDetailsModel
                    .publicTrip!.publicTripPlace![index].tourismPlace!,
                isEnd: index ==
                    readyTripsDetailsModel.publicTrip!.publicTripPlace!.length -
                        1,
              ),
            );
          },
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: CustomButton(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kApplyTheTripView);
                },
                text: LocaleKeys.apply_for_this_trip.tr(),
                width: MediaQuery.sizeOf(context).width,
                borderRadius: 24,
                height: 50,
                style: AppStyles.styleInterBold20(context)
                    .copyWith(color: Colors.white),
                color: kPrimaryColor),
          ),
        )
      ],
    );
  }
}

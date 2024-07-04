import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trip_details_card.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/compact_calendar_widget.dart';

class ReadyTripDetailsListView extends StatelessWidget {
  const ReadyTripDetailsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: CompactCalendarWidget()),
        const SliverToBoxAdapter(child: Gap(24)),
        SliverList.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            int length = 3;
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: ReadyTripDetailsCard(
                isEnd: index == length - 1,
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
                text: 'Apply for this trip',
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

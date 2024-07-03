import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/compact_calendar_widget.dart';

class ReadyTripDetailsViewBody extends StatelessWidget {
  const ReadyTripDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CompactCalendarWidget()),
          SliverToBoxAdapter(child: Gap(24)),
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
      ),
    );
  }
}

class ReadyTripDetailsCard extends StatelessWidget {
  const ReadyTripDetailsCard({
    super.key,
    required this.isEnd,
  });
  final bool isEnd;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
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
              Text(
                'see more',
                style: AppStyles.styleQuickSemiBold18(context)
                    .copyWith(color: kPrimaryColor.withOpacity(.7)),
              ),
            ],
          ),
          Gap(13),
          Image.asset(Assets.imagesPlacesTest),
        ],
      ),
    );
  }
}

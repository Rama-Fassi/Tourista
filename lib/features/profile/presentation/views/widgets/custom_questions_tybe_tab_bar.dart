import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/profile/presentation/views/widgets/faq_tab_bar_view.dart';

class CustomQuestionsTybeTabBar extends StatelessWidget {
  const CustomQuestionsTybeTabBar({
    super.key,
    required this.widget,
  });

  final FaqTabBarView widget;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        overlayColor: MaterialStateProperty.all(
          Colors.transparent,
        ),
        automaticIndicatorColorAdjustment: false,
        labelPadding: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.only(top: 10),
        indicatorPadding:
            const EdgeInsets.symmetric(horizontal: 0, vertical: 10.2),
        controller: widget.tabController2,
        labelColor: Colors.black,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        labelStyle: AppStyles.styleInterMedium19(context),
        unselectedLabelColor: Colors.black,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(.5)),
            borderRadius: BorderRadius.circular(5)),
        tabs: const [
          AllTab(),
          FlightsTab(),
          StaysTab(),
          ActivitiesTab(),
        ]);
  }
}

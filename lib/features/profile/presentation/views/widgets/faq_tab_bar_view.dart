import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/main/presentation/views/widgets/custom_tab_TabBar.dart';
import 'package:tourista/features/profile/presentation/views/widgets/questions_with_tybe_section.dart';

import 'all_questions_section.dart';
import 'custom_questions_tybe_tab_bar.dart';

class FaqTabBarView extends StatefulWidget {
  const FaqTabBarView({
    super.key,
    required this.tabController2,
  });

  final TabController tabController2;

  @override
  State<FaqTabBarView> createState() => _FaqTabBarViewState();
}

class _FaqTabBarViewState extends State<FaqTabBarView> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Text(
            LocaleKeys.Frequently_asked_questions.tr(),
            style: AppStyles.styleInterSemiBold20(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: CustomQuestionsTybeTabBar(widget: widget),
        ),
        Expanded(
          child: TabBarView(
            controller: widget.tabController2,
            children: [
              AllQuestionsSection(screenWidth: screenWidth),
              QuestionsWithTybeSection(
                  screenWidth: screenWidth, tybe: 'Flights'),
              QuestionsWithTybeSection(screenWidth: screenWidth, tybe: 'Stays'),
              QuestionsWithTybeSection(
                  screenWidth: screenWidth, tybe: 'Activities'),
            ],
          ),
        ),
      ],
    );
  }
}

class ActivitiesTab extends StatelessWidget {
  const ActivitiesTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 3.5),
          child: CustomTabForTabBar(
            data: LocaleKeys.Activities.tr(),
            assetName: Assets.imagesIconsActivities,
            iconColor: Colors.black,
          )),
    );
  }
}

class StaysTab extends StatelessWidget {
  const StaysTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 3.5),
          child: CustomTabForTabBar(
            data: LocaleKeys.Stays.tr(),
            assetName: Assets.imagesIconsStays,
            iconColor: Colors.black,
          )),
    );
  }
}

class FlightsTab extends StatelessWidget {
  const FlightsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 3.5),
          child: CustomTabForTabBar(
            data: LocaleKeys.Flights.tr(),
            assetName: Assets.imagesIconsFlightsSupportIcon,
          )),
    );
  }
}

class AllTab extends StatelessWidget {
  const AllTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 3.5),
          child: CustomTabForTabBar(
            data: LocaleKeys.all.tr(),
            assetName: Assets.imagesIconsAllIcon,
          )),
    );
  }
}

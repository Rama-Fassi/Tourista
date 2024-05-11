import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/features/onboarding/data/models/onboarding_model.dart';
import 'package:tourista/features/onboarding/views/widgets/onboarding_page.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    super.key,
    required this.controller,
  });

  final PageController controller;
  final List<OnboardingModel> onboardingItems = const [
    OnboardingModel(
      padding: true,
      color: Color(0xffFCFCFE),
      desc: "Welcome to Tourista!where you can explore the world",
      imageUrl: Assets.imagesIntro1,
      pageIndex: 0,
    ),
    OnboardingModel(
      padding: false,
      color: Color(0xffE9DDB6),
      desc: "Join to our special trips for your favorite places in the world  ",
      imageUrl: Assets.imagesIntro2,
      pageIndex: 1,
    ),
    OnboardingModel(
      padding: true,
      color: Color(0xffA3BC9E),
      desc: "Plan your trip from A to z with us! ",
      imageUrl: Assets.imagesIntro3,
      pageIndex: 2,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 3,
      controller: controller,
      itemBuilder: (BuildContext context, int index) {
        return OnBoardingPage(
          onboardingModel: onboardingItems[index],
        );
      },
    );
  }
}

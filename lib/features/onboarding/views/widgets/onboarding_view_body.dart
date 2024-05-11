import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/onboarding/views/widgets/dots_indicator.dart';
import 'package:tourista/features/onboarding/views/widgets/onboarding_page_view.dart';

class OnbaordingViewBody extends StatefulWidget {
  const OnbaordingViewBody({super.key});

  @override
  State<OnbaordingViewBody> createState() => _OnbaordingViewBodyState();
}

class _OnbaordingViewBodyState extends State<OnbaordingViewBody> {
  late PageController pageController;
  int currentPageIndex = 0;
  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPageIndex = pageController.page!.round();
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OnboardingPageView(
          controller: pageController,
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).width * .15,
          left: 15,
          right: 15,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: currentPageIndex != 2
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context)
                              .pushReplacement(AppRouter.kHomeView);
                        },
                        child: Text(
                          'Skip',
                          style:
                              AppStyles.styleSourceSemiBold28(context).copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(),
                      DotsIndicator(currentPageIndex: currentPageIndex),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.linear);
                        },
                        child: Text(
                          'Next',
                          style: AppStyles.styleSourceSemiBold28(context)
                              .copyWith(color: Colors.white),
                        ),
                      )
                    ],
                  )
                : GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                      Hive.box(kOnboarding).put('bool', true);
                    },
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: AppStyles.styleInterBold30(context).copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
          ),
        )
      ],
    );
  }
}

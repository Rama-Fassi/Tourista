import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/add_to_plan_button.dart';

import '../../../../../../core/utlis/app_assets.dart';
import 'activity_texts_details.dart';

class ActivityDetailsViewBody extends StatefulWidget {
  const ActivityDetailsViewBody({super.key});

  @override
  State<ActivityDetailsViewBody> createState() =>
      _ActivityDetailsViewBodyState();
}

class _ActivityDetailsViewBodyState extends State<ActivityDetailsViewBody> {
  final PageController pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    List<Widget> images = [
      Image.asset(
        Assets.imagesImageActivity1,
        fit: BoxFit.cover,
      ),
      Image.asset(
        Assets.imagesImageActivity2,
        fit: BoxFit.cover,
      ),
      Image.asset(
        Assets.imagesImageActivity,
        fit: BoxFit.cover,
      ),
    ];
    return Stack(alignment: Alignment.bottomCenter, children: [
      SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 350,
              child: imagesPageViewWithCounter(images, screenWidth, context),
            ),
            const Gap(10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ActivityTextsDetails(),
            ),
            const Gap(100),
          ],
        ),
      ),
      AddToPlanButton(screenWidth: screenWidth, onTap: () {}),
    ]);
  }

  Stack imagesPageViewWithCounter(
      List<Widget> images, double screenWidth, BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: pageController,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return images[index];
          },
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
        ),
        Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              iconSize: 20,
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 40,
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //  Gap(10),
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                    color: Colors.white,
                    onPressed: () {
                      pageController.animateToPage(currentPage - 1,
                          duration: const Duration(seconds: 1),
                          curve: Curves.ease);
                    },
                  ),
                  Text(
                    '${currentPage + 1} of ${images.length}',
                    style: AppStyles.styleInterBold20(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 20),
                    color: Colors.white,
                    onPressed: () {
                      pageController.animateToPage(currentPage + 1,
                          duration: const Duration(seconds: 1),
                          curve: Curves.ease);
                    },
                  ),
                  //   Gap(5),
                ]),
          ),
        ),
      ],
    );
  }
}

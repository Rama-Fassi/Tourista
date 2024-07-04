import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';

class PlacesImagePageView extends StatefulWidget {
  const PlacesImagePageView({super.key});

  @override
  State<PlacesImagePageView> createState() => _PlacesImagePageViewState();
}

class _PlacesImagePageViewState extends State<PlacesImagePageView> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<String> images = [
      Assets.imagesHotelTest,
      Assets.imagesPlacesTest,
      Assets.imagesReadyTripsTest2
    ];
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .6,
      child: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                  width: screenWidth,
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  ));
            },
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 40,
                height: 44,
                margin: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  color: kPrimaryColor,
                  iconSize: 20,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
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
      ),
    );
  }
}

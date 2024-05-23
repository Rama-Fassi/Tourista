import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/flights_view_body.dart';

class PrivateTripTapBar extends StatelessWidget {
  const PrivateTripTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
            length: 4,
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: SvgPicture.asset(
                  Assets.imagesTouristaLogoWhite,
                  width: 115,
                ),
                backgroundColor: kPrimaryColor,
                //     elevation: 0,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(70),
                  child: TabBar(
                      padding: const EdgeInsets.only(left: 20, bottom: 10),
                      labelColor: Colors.white,
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      labelStyle: AppStyles.styleSourceSemiBold20(context),
                      unselectedLabelColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white.withOpacity(.20),
                      ),
                      tabs: [
                        Tab(
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.imagesIconsFlights),
                              const SizedBox(
                                width: 7,
                              ),
                              const Text('Flights')
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.imagesIconsStays),
                              const SizedBox(
                                width: 7,
                              ),
                              const Text('Stays')
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.imagesIconsActivities),
                              const SizedBox(
                                width: 7,
                              ),
                              const Text('Activities')
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.imagesIconsThePlan),
                              const SizedBox(
                                width: 7,
                              ),
                              const Text('The Plan')
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              body: const TabBarView(children: [
                FligtsViewBody(),
                Icon(Icons.home),
                Icon(Icons.local_activity),
                Icon(Icons.start),
              ]),
            )));
  }
}

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/features/attractions/presentation/views/attractions_view_body.dart';
import 'package:tourista/features/my_trips/presentation/views/my_trips_view_body.dart';
import 'package:tourista/features/private_trip/main/data/repos/main_repo_impl.dart';
import 'package:tourista/features/private_trip/main/presentation/manager/create_trip_cubit/create_trip_cubit.dart';
import 'package:tourista/features/private_trip/main/presentation/views/private_trip_main_view_body.dart';
import 'package:tourista/features/profile/presentation/views/profile_view_body.dart';
import 'package:tourista/features/ready_trips/presentation/views/ready_trip_main_view_body.dart';


class NavigationBArScaffold extends StatefulWidget {
  const NavigationBArScaffold({super.key});

  @override
  State<NavigationBArScaffold> createState() => _NavigationBArScaffoldState();
}

class _NavigationBArScaffoldState extends State<NavigationBArScaffold> {
  List<Widget> navList = [
    const MyTripsViewBody(),
    const AttractionsViewBody(),
    const PrivatTripMainViewBody(),
    const ProfileViewBody(),
  ];
  int activeIndex = -1;
  @override
  Widget build(BuildContext context) {
    var iconList = [
      Icons.badge_outlined,
      Icons.attractions_outlined,
      Icons.widgets_outlined,
      Icons.account_circle_outlined
    ];
    return SafeArea(
        child: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateTripCubit(getIt.get<MainRepoImpl>()),
        ),
      ],
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: floatingActionButton(),
          bottomNavigationBar: animatedBottomNavigationaBar(iconList),
          body: activeIndex == -1
              ? const ReadyTripMainViewBody()
              : navList.elementAt(activeIndex)),
    ));
  }

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () {
        setState(() {
          activeIndex = -1;
        });
      },
      backgroundColor: activeIndex == -1 ? kPrimaryColor : Colors.white,
      child: Center(
        child: SvgPicture.asset(
          width: 28,
          height: 28,
          Assets.imagesIconsReadyTripIcon,
          color:
              activeIndex == -1 ? Colors.white : kPrimaryColor.withOpacity(.5),
        ),
      ),
    );
  }

  AnimatedBottomNavigationBar animatedBottomNavigationaBar(
      List<IconData> iconList) {
    return AnimatedBottomNavigationBar(
      icons: iconList,
      activeIndex: activeIndex,
      onTap: (index) {
        setState(() {
          activeIndex = index;
        });
      },
      inactiveColor: kPrimaryColor.withOpacity(.4),
      activeColor: kPrimaryColor,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      iconSize: 30,
    );
  }
}

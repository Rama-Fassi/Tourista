import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tourista/constants.dart';

class NavigationBArScaffold extends StatefulWidget {
  const NavigationBArScaffold({super.key});

  @override
  State<NavigationBArScaffold> createState() => _NavigationBArScaffoldState();
}

class _NavigationBArScaffoldState extends State<NavigationBArScaffold> {
  int activeIndex = 2;
  @override
  Widget build(BuildContext context) {
    var iconList = [Icons.menu, Icons.favorite, Icons.badge, Icons.home];
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: activeIndex,
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        inactiveColor: Colors.grey,
        activeColor: kPrimaryColor,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
      ),
      body: Container(color: Colors.white),
    ));
  }
}

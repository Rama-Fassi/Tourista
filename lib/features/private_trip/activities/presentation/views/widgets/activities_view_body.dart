import 'package:flutter/material.dart';

import 'activities_list_view.dart';
import 'add_to_plan_button.dart';
import 'custom_colorful_tabBar.dart';
import 'custom_search_text_field.dart';

class ActivitiesViewScaffold extends StatelessWidget {
  const ActivitiesViewScaffold({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        leadingWidth: 30,
        titleSpacing: 20,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 100,
        title: const SizedBox(
          height: 55,
          child: CustomSearchTextField(),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: CustomColorfulTabBar(),
        ),
      ),
      body: Stack(
        children: [
          ActivitiesListView(
            screenWidth: screenWidth,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child:
                  AddToPlanButton(screenWidth: screenWidth, onTap: () {}))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';

class ThePlanViewBody extends StatelessWidget {
  const ThePlanViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
      onTap: () {
      },
      child: Text(
        "The Plan here",
        style: AppStyles.styleInterBold20(context),
      ),
    ));
  }
}
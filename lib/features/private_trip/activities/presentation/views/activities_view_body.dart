import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class ActivitiesViewBody extends StatelessWidget {
  const ActivitiesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return
   Center(
        child: Text(
      "Hello Rama please start from here",
      style: AppStyles.styleInterBold20(context),
    ));
  }
}
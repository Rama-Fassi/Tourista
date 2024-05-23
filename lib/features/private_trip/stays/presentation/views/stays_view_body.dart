import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class StaysViewBody extends StatelessWidget {
  const StaysViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return
   Center(
        child: Text(
      "Stays here",
      style: AppStyles.styleInterBold20(context),
    ));
  }
}
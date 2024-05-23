import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class FligtsViewBody extends StatelessWidget {
  const FligtsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      "Hello Raghad please start from here",
      style: AppStyles.styleInterBold20(context),
    ));
  }
}

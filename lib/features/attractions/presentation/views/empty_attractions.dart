import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class EmptyAttractions extends StatelessWidget {
  const EmptyAttractions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
            child: Text(
        'No attractions yet!',
        style: AppStyles.styleInterBold20(context),
      )));
  }
}

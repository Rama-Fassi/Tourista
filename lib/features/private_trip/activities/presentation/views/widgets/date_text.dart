import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class DateText extends StatelessWidget {
  const DateText({
    super.key, required this.theDate,
  });

  final DateTime theDate;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          DateFormat('EEEE d MMMM ').format(theDate),
          style:
              AppStyles.styleInterSemiBold20(context),
          textAlign: TextAlign.start,
        ));
  }
}

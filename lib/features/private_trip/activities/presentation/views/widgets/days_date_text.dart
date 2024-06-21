import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utlis/styles.dart';

class DaysDateText extends StatelessWidget {
  const DaysDateText({
    super.key,
    required this.dateTimes,
    required this.index,
  });
  final int index;
  final List<DateTime> dateTimes;

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFormat('EEEE d MMMM ').format(dateTimes[index]),
      style: AppStyles.styleInterSemiBold20(context),
      textAlign: TextAlign.start,
    );
  }
}

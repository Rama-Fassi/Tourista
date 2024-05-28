import 'package:flutter/material.dart';
import 'package:tourista/core/utlis/styles.dart';

class TicketsTime extends StatelessWidget {
  const TicketsTime({
    super.key,
    required this.time,
    required this.airport,
    required this.date,
  });
  final String time, airport, date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          time,
          style: AppStyles.styleInterBold20(context).copyWith(fontSize: 17),
        ),
        Text(
          airport,
          style: AppStyles.styleInterMedium18(context),
        ),
        Text(
          date,
          style: AppStyles.styleInterMedium18(context),
        )
      ],
    );
  }
}

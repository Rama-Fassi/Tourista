import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/airline_widget.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/ticket_time_start_and_end.dart';

class TicketTimeAndAirline extends StatelessWidget {
  const TicketTimeAndAirline({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [TicketTimeStartAndEnd(width: width), Gap(5), AirlineWidget()],
    );
  }
}

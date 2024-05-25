import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/ticket_duration.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/tickets_time.dart';

class TicketTimeStartAndEnd extends StatelessWidget {
  const TicketTimeStartAndEnd({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const TicketsTime(
          time: '17:5',
          airport: "DXB",
          date: '18-5',
        ),
        const Gap(10),
        TicketDuration(width: width),
        const Gap(10),
        const TicketsTime(
          time: '17:5',
          airport: "DXB",
          date: '18-5',
        ),
      ],
    );
  }
}

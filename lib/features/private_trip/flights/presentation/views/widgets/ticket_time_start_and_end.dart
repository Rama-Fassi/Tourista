import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/flights/data/models/tickets_model/ticket.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/ticket_duration.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/tickets_time.dart';

class TicketTimeStartAndEnd extends StatelessWidget {
  const TicketTimeStartAndEnd({
    super.key,
    required this.width,
    required this.ticket,
    required this.airFrom,
    required this.airTo,
  });

  final double width;
  final Ticket ticket;
  final String airFrom, airTo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TicketsTime(
          time: ticket.timeOfticket!.substring(0, 5),
          airport: airFrom,
          date: ticket.dateOfTicket!.substring(5),
        ),
        Spacer(),
        TicketDuration(
          width: width,
          duratoin: ticket.duration!,
        ),
        Spacer(),
        TicketsTime(
          time: '17:5',
          airport: airTo,
          date: '18-5',
        ),
      ],
    );
  }
}

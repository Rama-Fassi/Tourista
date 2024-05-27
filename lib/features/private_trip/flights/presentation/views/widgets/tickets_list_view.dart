import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/flights/data/models/tickets_model/ticket.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/one_way_ticket.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/round_trip_ticket.dart';

class TicketsListView extends StatelessWidget {
  const TicketsListView({
    super.key,
    required this.width,
    required this.height,
    required this.tickets,
    required this.airFrom,
    required this.airTo,
  });

  final double width;
  final double height;
  final List<Ticket> tickets;
  final String airFrom, airTo;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: tickets[index].roundOrOneTrip == 'RoundTrip'
                ? RoundTripTicket(
                    width: width,
                    height: height,
                    ticket: tickets[index],
                  )
                : OneWayTicket(
                    width: width,
                    height: height,
                    ticket: tickets[index],
                    airFrom: airFrom,
                    airTo: airTo,
                  ),
          );
        });
  }
}

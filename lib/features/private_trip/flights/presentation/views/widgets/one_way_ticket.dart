import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/luggage.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/price_and_add_to_plan.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/sort_by_tickets_row.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/ticket_time_and_airline.dart';

class OneWayTicket extends StatelessWidget {
  const OneWayTicket({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: width,
      decoration: BoxDecoration(
          color: Colors.white, boxShadow: [boxShadow(4, 4), boxShadow(-4, 4)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SortByTicketsRow(),
          Gap(12),
          TicketTimeAndAirline(width: width),
          Gap(12),
          Divider(
            color: Colors.black.withOpacity(.35),
          ),
          Gap(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Luggage(width: width),
              PriceAndAddToPlan(width: width, height: height)
            ],
          )
        ],
      ),
    );
  }

  BoxShadow boxShadow(double y, double blur) {
    return BoxShadow(
      color: Colors.grey.withOpacity(.1),
      blurRadius: blur,
      offset: Offset(0, y),
    );
  }
}

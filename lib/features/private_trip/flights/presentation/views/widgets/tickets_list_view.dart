
import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/one_way_ticket.dart';

class TicketsListView extends StatelessWidget {
  const TicketsListView({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: OneWayTicket(width: width, height: height),
          );
        });
  }
}

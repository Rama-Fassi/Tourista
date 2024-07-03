import 'package:flutter/material.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trips_card_column.dart';

class ReadyTripsCard extends StatelessWidget {
  const ReadyTripsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            boxShadow(4, 4, 4),
            boxShadow(4, 4, -4),
            boxShadow(-4, 4, -4),
            boxShadow(-4, 4, 4)
          ]),
      child: ReadyTripsCardColumn(),
    );
  }

  BoxShadow boxShadow(double y, double blur, double x) {
    return BoxShadow(
      color: Colors.grey.withOpacity(.1),
      blurRadius: blur,
      offset: Offset(x, y),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/my_trips_active_card.dart';

class ActiveBody extends StatelessWidget {
  const ActiveBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return MyTripsActiveCard();
        },
      ),
    );
  }
}

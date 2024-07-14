import 'package:flutter/material.dart';
import 'package:tourista/features/my_trips/presentation/views/widgets/my_trips_past_card.dart';

class PastBody extends StatelessWidget {
  const PastBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return MyTripsPastCard();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trips_card.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/ready_trips_sort_by.dart';

class ReadyTripsTabBarView extends StatelessWidget {
  const ReadyTripsTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: const ReadyTripsSortBy(),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 18),
                child: ReadyTripsCard(),
              );
            },
          ))
        ],
      ),
    );
  }
}

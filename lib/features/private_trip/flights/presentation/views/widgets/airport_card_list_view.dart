import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/airport_card.dart';

class AirportCardListView extends StatelessWidget {
  const AirportCardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .pop({"id": 1, "airport": "Miami international Airport"});
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: AirportCard(),
          ),
        );
      },
    ));
  }
}

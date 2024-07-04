import 'package:flutter/material.dart';
import 'package:tourista/features/ready_trips/presentation/views/widgets/every_place_detail_body.dart';

class EveryPlaceDetail extends StatelessWidget {
  const EveryPlaceDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: EveryPlaceDetailBody(),
      ),
    );
  }
}

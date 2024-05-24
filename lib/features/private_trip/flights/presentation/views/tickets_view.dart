import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/tickets_view_body.dart';

class TicketsView extends StatelessWidget {
  const TicketsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: TicketsViewBody(),
    ));
  }
}

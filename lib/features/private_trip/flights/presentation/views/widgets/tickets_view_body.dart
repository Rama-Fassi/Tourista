import 'package:flutter/material.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/widgets/tickets_view_app_bar.dart';

class TicketsViewBody extends StatelessWidget {
  const TicketsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        TickesViewAppBar(width: width, height: height),
      ],
    );
  }
}

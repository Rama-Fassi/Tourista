import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_detail_view_body.dart';

class HotelDetailView extends StatelessWidget {
  const HotelDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          backgroundColor: kPrimaryColor,
        ),
        body: HotelDetailViewBody(),
      ),
    );
  }
}

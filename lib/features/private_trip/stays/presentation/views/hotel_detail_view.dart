import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/features/private_trip/stays/presentation/manager/hotel_info_cubit/hotel_info_cubit.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_detail_view_body.dart';

class HotelDetailView extends StatelessWidget {
  const HotelDetailView({super.key, required this.info});

  final Map<String, dynamic> info;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.read<HotelInfoCubit>().resetCubit();
                GoRouter.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          backgroundColor: kPrimaryColor,
        ),
        body: HotelDetailViewBody(
          tripId: info['tripId'],
          hotel: info['hotel'],
        ),
      ),
    );
  }
}

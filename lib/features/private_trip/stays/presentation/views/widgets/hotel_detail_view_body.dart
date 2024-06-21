import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/check_in_check_out_row.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/features_row.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_details_photos_down_grid.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_details_photos_up_grid.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/stars_main_row.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/title_details_hotel.dart';

class HotelDetailViewBody extends StatelessWidget {
  const HotelDetailViewBody({super.key, required this.hotel});
  final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: TitleDetailsHotel(hotel: hotel),
          ),
          const SliverToBoxAdapter(child: Gap(14)),
          SliverToBoxAdapter(
            child: StarsMainRow(hotel: hotel),
          ),
          const SliverToBoxAdapter(child: Gap(20)),
          HotelDetailsPhotosUpGrid(hotel: hotel),
          const SliverToBoxAdapter(child: Gap(6)),
          HotelDetailsPhotosDownGrid(hotel: hotel),
          const SliverToBoxAdapter(child: Gap(16)),
          SliverToBoxAdapter(
            child: FeaturesRow(hotel: hotel),
          ),
          const SliverToBoxAdapter(child: Gap(16)),
          const SliverToBoxAdapter(
            child: CheckInCheckOutRow(),
          )
        ],
      ),
    );
  }
}

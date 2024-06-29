import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/functions/custom_success_snack_bar.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/core/widgets/custom_divider.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/widgets/add_to_plan_button.dart';
import 'package:tourista/features/private_trip/stays/data/models/hotels_model/hotel.dart';
import 'package:tourista/features/private_trip/stays/data/repos/stays_repo_impl.dart';
import 'package:tourista/features/private_trip/stays/presentation/manager/add_hotel_cubit/add_hotel_cubit.dart';
import 'package:tourista/features/private_trip/stays/presentation/manager/hotel_info_cubit/hotel_info_cubit.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/check_in_check_out_row.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/column_details_review.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/features_row.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_details_average_price.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_details_location.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_details_photos_down_grid.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_details_photos_up_grid.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/room_section.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/stars_main_row.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/title_details_hotel.dart';
import 'hotel_details_reviews.dart';

class HotelDetailViewBody extends StatelessWidget {
  const HotelDetailViewBody(
      {super.key, required this.hotel, required this.tripId});
  final Hotel hotel;
  final int tripId;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
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
                ),
                const SliverToBoxAdapter(child: Gap(20)),
                SliverToBoxAdapter(
                  child: HotelDetailsAveragePrice(hotel: hotel),
                ),
                const SliverToBoxAdapter(child: Gap(20)),
                const SliverToBoxAdapter(child: CustomDivider()),
                const SliverToBoxAdapter(child: Gap(15)),
                const SliverToBoxAdapter(
                  child: HotelDetailsLocation(),
                ),
                const SliverToBoxAdapter(child: Gap(10)),
                const SliverToBoxAdapter(child: CustomDivider()),
                SliverToBoxAdapter(
                  child: HotelDetailsReviews(hotel: hotel),
                ),
                const SliverToBoxAdapter(child: CustomDivider()),
                SliverToBoxAdapter(
                  child: ColumnDetailsReview(hotel: hotel),
                ),
                const SliverToBoxAdapter(child: CustomDivider()),
                const SliverToBoxAdapter(
                  child: RoomSection(),
                )
              ],
            ),
          ),
        ),
        BlocBuilder<HotelInfoCubit, HotelInfoState>(
          builder: (context, hotelInfostate) {
            return BlocProvider(
              create: (context) => AddHotelCubit(getIt.get<StaysRepoImpl>()),
              child: BlocConsumer<AddHotelCubit, AddHotelState>(
                listener: (context, state) {
                  if (state is AddHotelFailure) {
                    customSnackBar(context, state.errMessage);
                  }
                  if (state is AddHotelSuccess) {
                    customSuccessSnackBar(context, "Room Added Successfully");
                  }
                },
                builder: (context, state) {
                  return state is AddHotelLoading
                      ? const SpinKitThreeBounce(
                          color: kPrimaryColor,
                          size: 30,
                        )
                      : AddToPlanButton(
                          screenWidth: MediaQuery.sizeOf(context).width,
                          onTap: () {
                            List<dynamic> rooms = [];
                            hotelInfostate.rooms?.forEach((key, value) {
                              rooms.addAll([
                                {
                                  "roomHotel_id": key,
                                  "numberOfRoom": value[key][0]
                                },
                              ]);
                            });
                            BlocProvider.of<AddHotelCubit>(context)
                                .addHotelCubitFun(
                                    tripId: tripId,
                                    checkIn: hotelInfostate.checkIn == null
                                        ? ''
                                        : '${hotelInfostate.checkIn}'
                                            .substring(0, 10),
                                    checkOut: hotelInfostate.checkOut == null
                                        ? ''
                                        : '${hotelInfostate.checkOut}'
                                            .substring(0, 10),
                                    rooms: rooms);
                          });
                },
              ),
            );
          },
        )
      ],
    );
  }
}

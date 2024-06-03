import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/err_animation.dart';
import 'package:tourista/features/private_trip/stays/presentation/manager/hotels_cubit/hotels_cubit.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_list_view.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotels_shimmer.dart';

class CustomScrollViewWithBlocBuilder extends StatelessWidget {
  const CustomScrollViewWithBlocBuilder({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelsCubit, HotelsState>(
      builder: (context, state) {
        if (state is HotelsSuccess) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    '${state.hotelsModel.numberOfHotel} ${LocaleKeys.properties.tr()}',
                    style: AppStyles.styleInterRegular14(context),
                  ),
                ),
              ),
              state.hotelsModel.numberOfHotel == 0
                  ? ErrAnimation(errMessage: 'No Hotels Found!')
                  : HotelMainListView(
                      width: width,
                      height: height,
                      hotels: state.hotelsModel.hotel!,
                    ),
            ],
          );
        } else if (state is HotelsFailure) {
          return ErrAnimation(errMessage: state.errMessage);
        } else {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return HotelsShimmer(screenWidth: width, height: height);
            },
          );
        }
      },
    );
  }
}

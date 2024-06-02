import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/presentation/manager/hotels_cubit/hotels_cubit.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/hotel_main_list_view.dart';

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
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  ' ${LocaleKeys.properties.tr()}',
                  style: AppStyles.styleInterRegular14(context),
                ),
              ),
            ),
            HotelMainListView(width: width, height: height),
          ],
        );
      },
    );
  }
}

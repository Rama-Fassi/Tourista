import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/private_trip/stays/presentation/views/widgets/stars_main_row.dart';

import '../../manager/get_user_private_plan_cubit/get_user_private_plan_cubit.dart';

class HotelsListView extends StatelessWidget {
  const HotelsListView({
    super.key,
    required this.state,
  });
  final GetUserPrivatePlanSuccess state;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.getUserPrivatePlanModel.hotels!.length,
        itemBuilder: (context, hotelindex) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                        '$kBaseUrl${state.getUserPrivatePlanModel.hotels![hotelindex].images![0]}',
                        fit: BoxFit.cover,
                        height: 245,
                        width: MediaQuery.of(context).size.width * .35),
                  ),
                  const Gap(8),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              maxLines: 2,
                              state.getUserPrivatePlanModel.hotels![hotelindex]
                                  .hotelInfo!.name!,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.styleQuickBold22(context),
                            ),
                            const Gap(8),
                            StarsMainRow(
                              hotel: state
                                  .getUserPrivatePlanModel.hotels![hotelindex],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
          );
        });
  }
}

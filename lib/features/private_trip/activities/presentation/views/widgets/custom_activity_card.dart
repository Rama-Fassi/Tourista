import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/utlis/app_router.dart';

import '../../../../../../constants.dart';
import '../../../../../../core/utlis/app_assets.dart';
import '../../../../../../core/utlis/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'custom_check_box.dart';

class CustomActivityCard extends StatelessWidget {
  const CustomActivityCard({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Align(
            alignment: Alignment.center,
            child: CustomCheckbox(
              value: false,
              onChanged: (bool? value) {},
            ),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 4), // changes position of shadow
              )
            ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            width: screenWidth * .85,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 130,
                  height: 145,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      image: const DecorationImage(
                        image: AssetImage(Assets.imagesIntro2),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset:
                              const Offset(0, 4), // changes position of shadow
                        )
                      ]),
                ),
                const Gap(10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .47,
                  height: 140,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(3),
                      Text(
                        maxLines: 2,
                        'Museum of The Future',
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.styleQuickBold22(context),
                      ),
                      Text(
                        maxLines: 3,
                        'is a place to experience what could be Visitors are invited to explore immersive future to experience what could be Visitors are',
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.styleInterRegular14(context),
                      ),
                      const Gap(3),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CustomButton(
                            onTap: () {
                              GoRouter.of(context)
                                  .push(AppRouter.kActivityDetailsView);
                            },
                            text: "Details",
                            width: 55,
                            borderRadius: 10,
                            height: 23,
                            style: AppStyles.styleSourceBold12(context),
                            color: kPrimaryColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

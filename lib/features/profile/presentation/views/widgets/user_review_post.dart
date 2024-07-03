import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/profile/presentation/views/widgets/custom_circle_avatar.dart';

class UserReviewPost extends StatelessWidget {
  const UserReviewPost({
    super.key,
    required this.screenWidth,
    required this.circleAvatarName,
    required this.userName,
    required this.starsCount,
    required this.userCommunt,
    required this.userCommuntCreatedDate,
  });

  final double screenWidth;
  final String circleAvatarName;
  final String userName;
  final int starsCount;
  final String userCommunt;
  final String userCommuntCreatedDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomCircleAvatar(
              circleAvatarName: circleAvatarName,
            ),
            const Gap(10),
            SizedBox(
              width: screenWidth * .3,
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: AppStyles.styleInterBold25(context),
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: starsCount,
                        itemBuilder: (context, index) {
                          return const Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.orange,
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(15),
        Text(
          userCommunt,
          style: AppStyles.styleInterRegular18(context),
        ),
        const Gap(25),
        Text(
          userCommuntCreatedDate,
          style: AppStyles.styleInterRegular14(context),
        ),
        const Gap(10),
        Divider(
          color: Colors.black.withOpacity(.7),
        ),
        const Gap(10),
      ],
    );
  }
}

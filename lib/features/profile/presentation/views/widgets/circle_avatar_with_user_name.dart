import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:tourista/features/profile/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/utlis/styles.dart';

class CircleAvatarWithUserName extends StatelessWidget {
  const CircleAvatarWithUserName({
    super.key,
    required this.screenWidth,
    required this.screenheight,
  });

  final double screenWidth;
  final double screenheight;
  @override
  Widget build(BuildContext context) {
    String name = 'Rama';
    int points = 3;
    Hive.box(kUserInfoBox).get(kUserNameRef) == null
        ? BlocProvider.of<GetUserInfoCubit>(context).getUserInfo()
        : name = Hive.box(kUserInfoBox).get(kUserNameRef);

    return BlocListener<GetUserInfoCubit, GetUserInfoState>(
      listener: (context, state) {
        if (state is GetUserInfoSuccess) {
          name = state.userInfoModel.user!.name!;
          points == state.userInfoModel.user!.points!;
          Hive.box(kUserInfoBox)
              .put(kUserPointsRef, state.userInfoModel.user!.points);
          print('points: ${Hive.box(kUserInfoBox).get(kUserPointsRef)}');

          Hive.box(kUserInfoBox)
              .put(kUserNameRef, state.userInfoModel.user!.name);
          print(Hive.box(kUserInfoBox).get(kUserNameRef));
          Hive.box(kUserInfoBox)
              .put(kUserPhoneRef, state.userInfoModel.user?.normalUser?.phone);
          print(Hive.box(kUserInfoBox).get(kUserPhoneRef));
          state.userInfoModel.user?.googleUser != null
              ? Hive.box(kUserInfoBox).put(
                  kUserEmailRef, state.userInfoModel.user!.googleUser!.email)
              : Hive.box(kUserInfoBox).put(kUserEmailRef, null);
          print('email: ${Hive.box(kUserInfoBox).get(kUserEmailRef)}');
        }
      },
      child: Container(
        width: screenWidth,
        height: screenheight * .215,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kCircleAvatarColoe,
                border: Border.all(color: kYellowColor, width: 3),
              ),
              child: Center(
                child: Text(
                  Hive.box(kUserInfoBox).get(kUserNameRef) != null &&
                          Hive.box(kUserInfoBox).get(kUserNameRef).length >= 2
                      ? Hive.box(kUserInfoBox)
                          .get(kUserNameRef)
                          .substring(0, 2)
                          .toUpperCase()
                      : name.substring(0, 2).toUpperCase(),
                  style: AppStyles.styleInterBold27(context)
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            const Gap(10),
            Text(
              Hive.box(kUserInfoBox).get(kUserNameRef) ?? name,
              style: AppStyles.styleInterBold27(context)
                  .copyWith(color: Colors.white),
            ),
            const Gap(8),
            Text(
              Hive.box(kUserInfoBox).get(kUserPointsRef).toString(),
              style: AppStyles.styleInterSemiBold18(context)
                  .copyWith(color: kYellowColor),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}

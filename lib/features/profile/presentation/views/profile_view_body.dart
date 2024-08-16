import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:tourista/core/widgets/loading_widget.dart';
import 'package:tourista/core/widgets/snak_bar_widget.dart';
import 'package:tourista/features/profile/presentation/manager/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:tourista/features/profile/presentation/views/widgets/setting_section.dart';
import 'widgets/circle_avatar_with_user_name.dart';
import 'widgets/general_section.dart';
import 'widgets/help_and_support_section.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetUserInfoCubit>(context).getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
      builder: (context, state) {
        if (state is GetUserInfoSuccess) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatarWithUserName(
                    screenWidth: screenWidth, screenheight: screenheight),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GeneralSection(),
                      Gap(20),
                      HelpAndSupportSection(),
                      Gap(20),
                      SettingSection()
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is GetUserInfoFailure) {
          return SnakBarWidget(message: state.errMessage);
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}

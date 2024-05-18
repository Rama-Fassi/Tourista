import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/features/forget_password/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:tourista/features/forget_password/presentation/views/widgets/create_a_new_password.dart';
import 'package:tourista/features/forget_password/presentation/views/widgets/reset_succefully_widget.dart';
import 'package:tourista/features/forget_password/presentation/views/widgets/verify_button_and_range.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key, required this.userId});
  final int userId;
  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  late TextEditingController controller;
  late TextEditingController controller1;
  String password = '';
  String confirmPassword = '';
  @override
  void initState() {
    listenController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenheight = MediaQuery.sizeOf(context).height;
    bool isLoading = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        CreateANewPasswordColumn(
          screenheight: screenheight,
          screenWidth: screenWidth,
          controller: controller,
          controller2: controller1,
        ),
        const Spacer(
          flex: 13,
        ),
        BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            isLoading = checkStates(state, isLoading, context);
          },
          builder: (context, state) {
            return VerifyRangeAndButton(
                onTap: () {
                  BlocProvider.of<ResetPasswordCubit>(context)
                      .resetPasswordCubitFun(
                          password: password,
                          confirmPassword: confirmPassword,
                          userId: widget.userId);
                },
                screenheight: screenheight,
                screenWidth: screenWidth,
                numberOfSteps: "2 of 2",
                start: 0,
                end: 1);
          },
        ),
        const Spacer()
      ],
    );
  }

  bool checkStates(
      ResetPasswordState state, bool isLoading, BuildContext context) {
    if (state is ResetPasswordSuccess) {
      isLoading = false;
      showSuccessDialog(context);
    } else if (state is ResetPasswordFailure) {
      isLoading = false;
      customSnackBar(context, state.errMessage);
    } else if (state is ResetPasswordLoading) {
      isLoading = true;
    }
    return isLoading;
  }

  void listenController() {
    controller = TextEditingController();
    controller.addListener(() {
      password = controller.text;
      setState(() {});
    });
    controller1 = TextEditingController();
    controller1.addListener(() {
      confirmPassword = controller1.text;
      setState(() {});
    });
  }
}

Future<dynamic> showSuccessDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: SvgPicture.asset(Assets.imagesSuccessReset),
          content: const IntrinsicHeight(
            child: ResetSuccessfullyWidget(),
          ),
          actions: [
            Center(
              child: CustomButton(
                  onTap: () {
                    GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                  },
                  text: LocaleKeys.ok.tr(),
                  width: MediaQuery.sizeOf(context).width * .2,
                  borderRadius: 8,
                  height: 40,
                  style: AppStyles.styleInterBold20(context)
                      .copyWith(color: Colors.white),
                  color: kPrimaryColor),
            )
          ],
        );
      });
}

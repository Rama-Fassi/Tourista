import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/forget_password/presentation/manager/verify_code_cubit/verify_code_cubit.dart';
import 'package:tourista/features/forget_password/presentation/views/widgets/enter_verify_code_section.dart';
import 'package:tourista/features/forget_password/presentation/views/widgets/verify_button_and_range.dart';

class VerifyViewBody extends StatefulWidget {
  const VerifyViewBody({super.key, required this.userId});
  final int userId;
  @override
  State<VerifyViewBody> createState() => _VerifyViewBodyState();
}

class _VerifyViewBodyState extends State<VerifyViewBody> {
  TextEditingController controller = TextEditingController();
  String number = '';
  @override
  void initState() {
    controller = TextEditingController();
    controller.addListener(() {
      number = controller.text;
      setState(() {});
    });
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        EnterVerifyCodeSection(
            screenheight: screenheight,
            screenWidth: screenWidth,
            controller: controller),
        Gap(screenheight * .04),
        Text(
          LocaleKeys.DidntRecieveTheCode.tr(),
          style: AppStyles.styleInterMedium14(context)
              .copyWith(color: Colors.grey),
        ),
        Gap(screenheight * .01),
        GestureDetector(
          onTap: () {},
          child: Text(
            LocaleKeys.ResendPassword.tr(),
            style: AppStyles.styleInterBold16(context)
                .copyWith(color: kPrimaryColor),
          ),
        ),
        Gap(screenheight * .25),
        BlocConsumer<VerifyCodeCubit, VerifyCodeState>(
          listener: (context, state) {
            if (state is VerifyCodeSuccess) {
              isLoading = false;
              GoRouter.of(context)
                  .push(AppRouter.kResetPassword, extra: widget.userId);
            } else if (state is VerifyCodeFailure) {
              isLoading = false;
              customSnackBar(context, state.errMessage);
            } else if (state is VerifyCodeLoading) {
              isLoading = true;
            }
          },
          builder: (context, state) {
            return isLoading == true
                ? const Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  )
                : VerifyRangeAndButton(
                    onTap: () {
                      BlocProvider.of<VerifyCodeCubit>(context)
                          .verifyCodeCubitFun(
                              verifyCode: number, userId: widget.userId);
                    },
                    screenheight: screenheight,
                    screenWidth: screenWidth,
                    numberOfSteps: '1 of 2',
                    start: 0,
                    end: 0.5,
                  );
          },
        )
      ],
    );
  }
}

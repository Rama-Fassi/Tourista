import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/custom_button.dart';
import 'package:tourista/core/widgets/custom_text_button.dart';
import 'package:tourista/features/auth/forget_password/presentation/views/widgets/enter_verify_code_section.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/repos/auth_repo_impl.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/manager/verify_sign_up_cubit/verify_signup_cubit.dart';

class VerifySignUpBody extends StatefulWidget {
  const VerifySignUpBody(
      {super.key,
      required this.userid,
      required this.userName,
      required this.phoneNumber,
      required this.password,
      required this.confirmPassword});
  final int userid;
  final String userName;
  final String phoneNumber;
  final String password;
  final String confirmPassword;

  @override
  State<VerifySignUpBody> createState() => _VerifySignUpBodyState();
}

class _VerifySignUpBodyState extends State<VerifySignUpBody> {
  late TextEditingController controller;

  String number = '';

  @override
  void initState() {
    listenNumber();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenheight = MediaQuery.sizeOf(context).height;
    bool isLoading = false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        EnterVerifyCodeSection(
          screenWidth: screenWidth,
          screenheight: screenheight,
          controller: controller,
        ),
        Gap(screenheight * .04),
        Text(
          LocaleKeys.DidntRecieveTheCode.tr(),
          style: AppStyles.styleInterMedium14(context)
              .copyWith(color: Colors.grey),
        ),
        Gap(screenheight * .01),
        CustomTextButton(
          data: LocaleKeys.ResendPassword.tr(),
          style: AppStyles.styleInterBold16(context)
              .copyWith(color: kPrimaryColor),
          onPressed: () {
            AuthRepoImpl(getIt.get<ApiServer>()).signUp(
                name: widget.userName,
                phone: widget.phoneNumber,
                password: widget.password,
                confirmPassword: widget.confirmPassword);
          },
        ),
        /*GestureDetector(
          onTap: () {
            AuthRepoImpl(getIt.get<ApiServer>()).signUp(
                name: widget.userName,
                phone: widget.phoneNumber,
                password: widget.password,
                confirmPassword: widget.confirmPassword);
          },
          child: Text(
            LocaleKeys.ResendPassword.tr(),
            style: AppStyles.styleInterBold16(context)
                .copyWith(color: kPrimaryColor),
          ),
        ),*/
        Gap(screenheight * .25),
        BlocConsumer<VerifySignUpCubit, VerifySignUpState>(
          listener: (context, state) {
            if (state is VerifySignupSuccess) {
              isLoading = false;

              GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
            } else if (state is VerifySignupFailure) {
              isLoading = false;

              customSnackBar(context, state.errMessage);
            } else {
              isLoading = true;
            }
          },
          builder: (context, state) {
            return isLoading == true
                ? const SpinKitThreeBounce(
                    color: kGreenColor,
                    size: 40,
                  )
                : CustomButton(
                    onTap: () {
                      BlocProvider.of<VerifySignUpCubit>(context)
                          .verifySignUp(userId: widget.userid, code: number);
                    },
                    text: LocaleKeys.verify.tr(),
                    width: screenWidth * .80,
                    borderRadius: 10,
                    height: screenheight * .08,
                    style: AppStyles.styleInterBold20(context)
                        .copyWith(color: Colors.white),
                    color: kPrimaryColor);
          },
        ),
      ],
    );
  }

  void listenNumber() {
    controller = TextEditingController();
    controller.addListener(() {
      number = controller.text;
      setState(() {});
    });
  }
}
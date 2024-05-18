import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/features/Auth/presentation/view_models/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:tourista/features/Auth/presentation/view_models/sign_in_cubit/sign_in_cubit.dart';
import 'package:tourista/features/Auth/presentation/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:tourista/features/Auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:tourista/features/Auth/presentation/views/widgets/earth_logo_with_text.dart';
import 'package:tourista/features/Auth/presentation/views/widgets/forget_passord_button.dart';
import 'package:tourista/features/Auth/presentation/views/widgets/password_text_field.dart';
import 'package:tourista/features/Auth/presentation/views/widgets/taxt_with_text_button.dart';
import 'package:tourista/features/auth/presentation/views/widgets/continue_with_google_button.dart';
import 'package:tourista/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:tourista/features/auth/presentation/views/widgets/phone_number_text_field.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;

  @override
  void initState() {
    listenController();
    super.initState();
  }

  String phoneNumber = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    bool isLoading = false;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        child: Column(
          children: [
            Gap(screenheight * 0.05),
            EartLogoWithText(
              data: LocaleKeys.sign_in_to_your_account.tr(),
            ),
            Gap(screenheight * 0.09),
            PhoneNumberTextField(
              controller: phoneNumberController,
            ),
            Gap(screenheight * 0.04),
            PasswordTextField(
              controller: passwordController,
            ),
            Gap(screenheight * .005),
            const ForgetPasswordButton(),
            Gap(screenheight * 0.03),
            BlocConsumer<SignInCubit, SignInState>(
              listener: (context, state) {
                if (state is SignInSuccess) {
                  isLoading = false;

                  GoRouter.of(context).push(AppRouter.kHomeView);
                } else if (state is SignInFailure) {
                  isLoading = false;

                  customSnackBar(context, state.errMessage);
                } else {
                  isLoading = true;
                }
              },
              builder: (context, state) {
                return isLoading == true
                    ? const SpinKitPouringHourGlassRefined(
                        color: kGreenColor,
                        size: 60,
                      )
                    : CustomAuthButton(
                        text: LocaleKeys.sign_in.tr(),
                        width: screenWidth * .80,
                        onTap: () {
                          BlocProvider.of<SignInCubit>(context).signIn(
                            phone: phoneNumber,
                            password: password,
                          );
                        },
                      );
              },
            ),
            //CustomAuthButton(
            //  text: LocaleKeys.sign_in.tr(),
           //   width: screenWidth * .80,
          //  ),
            Gap(screenheight * .07),
            const ORDivider(),
            Gap(screenheight * .02),
            GoogleButton(
              onTap: () {
                GoogleSignInCubit().signInWithGoogle();
              },
            ),
            Gap(screenheight * .02),
            TextWithTextButton(
              data: LocaleKeys.dont_have_an_account.tr(),
              textButtondata: LocaleKeys.sign_up.tr(),
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSignUp);
              },
            ),
          ],
        ),
      ),
    );
  }

  void listenController() {
    phoneNumberController = TextEditingController();
    phoneNumberController.addListener(() {
      phoneNumber = phoneNumberController.text;
      setState(() {});
    });

    passwordController = TextEditingController();
    passwordController.addListener(() {
      password = passwordController.text;
      setState(() {});
    });
  }
}

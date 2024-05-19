import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/functions/custom_snack_bar.dart';
import 'package:tourista/features/Auth/presentation/view_models/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:tourista/features/Auth/presentation/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:tourista/features/Auth/presentation/views/widgets/confirm_password_text_field.dart';
import 'package:tourista/features/Auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:tourista/features/Auth/presentation/views/widgets/earth_logo_with_text.dart';
import 'package:tourista/features/Auth/presentation/views/widgets/password_text_field.dart';
import 'package:tourista/features/Auth/presentation/views/widgets/taxt_with_text_button.dart';
import 'package:tourista/features/Auth/presentation/views/widgets/user_name_text_field.dart';
import 'package:tourista/features/auth/presentation/views/widgets/continue_with_google_button.dart';
import 'package:tourista/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:tourista/features/auth/presentation/views/widgets/phone_number_text_field.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({
    super.key,
  });

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  late TextEditingController userNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;

  late TextEditingController confirmPasswordController;

  String name = '';
  String phoneNumber = '';
  String password = '';

  String confirmPassword = '';

  @override
  void initState() {
    listenController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        child: Column(
          children: [
            Gap(screenheight * 0.05),
            EartLogoWithText(
              data: LocaleKeys.create_an_account.tr(),
            ),
            Gap(screenheight * 0.02),
            UserNameTextField(
              textEditingController: userNameController,
            ),
            Gap(screenheight * 0.03),
            PhoneNumberTextField(
              controller: phoneNumberController,
            ),
            Gap(screenheight * 0.03),
            PasswordTextField(
              controller: passwordController,
            ),
            Gap(screenheight * 0.03),
            ConfirmPasswordTextField(
              controller: confirmPasswordController,
            ),
            Gap(screenheight * .04),
            BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is SignUpSuccess) {
                  isLoading = false;

                  GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                } else if (state is SignUpFailure) {
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
                        text: LocaleKeys.sign_up.tr(),
                        width: screenWidth * .80,
                        onTap: () {
                          BlocProvider.of<SignUpCubit>(context).signUp(
                              name: name,
                              phone: phoneNumber,
                              password: password,
                              confirmPassword: confirmPassword);
                        },
                      );
              },
            ),
            Gap(screenheight * .03),
            const ORDivider(),
            Gap(screenheight * .02),
            GoogleButton(
              onTap: () {
                GoogleSignInCubit().signInWithGoogle();
              },
            ),
            Gap(screenheight * .02),
            TextWithTextButton(
                data: LocaleKeys.already_have_an_account.tr(),
                textButtondata: LocaleKeys.sign_in.tr(),
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kSignIN);
                }),
          ],
        ),
      ),
    );
  }

  void listenController() {
    userNameController = TextEditingController();
    userNameController.addListener(() {
      name = userNameController.text;
      setState(() {});
    });

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

    confirmPasswordController = TextEditingController();
    confirmPasswordController.addListener(() {
      confirmPassword = confirmPasswordController.text;
      setState(() {});
    });
  }
}

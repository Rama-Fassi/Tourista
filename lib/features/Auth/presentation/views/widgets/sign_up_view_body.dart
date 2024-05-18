import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
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
            const UserNameTextField(),
            Gap(screenheight * 0.03),
            const PhoneNumberTextField(),
            Gap(screenheight * 0.03),
            const PasswordTextField(),
            Gap(screenheight * 0.03),
            const ConfirmPasswordTextField(),
            Gap(screenheight * .04),
            BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is SignUpSuccess) {
                  isLoading = false;
                  GoRouter.of(context).push(AppRouter.kForgetPassword);
                } else if (state is SignUpFailure) {
                  isLoading = false;
                  customSnackBar(context, state.errMessage);
                } else {
                  isLoading = true;
                  CircularProgressIndicator();
                }
              },
              builder: (context, state) {
                return CustomAuthButton(
                  text: LocaleKeys.sign_up.tr(),
                  width: screenWidth * .80,
                  onTap: () {
                    BlocProvider.of<SignUpCubit>(context).signUp(
                        name: "Rama Fassi",
                        phone: "0985392515",
                        password: "123456789",
                        confirmPassword:"123456789" );
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
}

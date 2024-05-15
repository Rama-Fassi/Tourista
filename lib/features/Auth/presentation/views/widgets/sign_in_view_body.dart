import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/core/widgets/password_text_field.dart';
import 'package:tourista/features/auth/presentation/views/widgets/continue_with_google_button.dart';
import 'package:tourista/features/auth/presentation/views/widgets/custom_authButton.dart';
import 'package:tourista/features/auth/presentation/views/widgets/earth_logo.dart';
import 'package:tourista/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:tourista/features/auth/presentation/views/widgets/phone_number_text_field.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              children: [
                kSizedBox10h,
                const EartLogo(),
                kSizedBox20h,
                Text(
                  LocaleKeys.sign_in_to_your_account.tr(),
                  style: AppStyles.styleInterBold30(context)
                      .copyWith(color: kPrimaryColor),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .08,
                ),
                const PhoneNumberTextField(),
                kSizedBox30h,
                const PasswordTextField(),
                kSizedBox10h,
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kForgetPassword);
                  },
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      LocaleKeys.forget_password.tr(),
                      style: AppStyles.styleSourceBold20(context),
                    ),
                  ),
                ),
                kSizedBox30h,
                CustomAuthButton(
                  screenWidth: screenWidth,
                  text: LocaleKeys.sign_in.tr(),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .08,
                ),
                const ORDivider(),
                kSizedBox20h,
                GoogleButton(),
                kSizedBox20h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.dont_have_an_account.tr(),
                      style: AppStyles.styleSourceSemiBold20(context)
                          .copyWith(color: Colors.black),
                    ),
                    //  kSizedBox5w,
                    TextButton(
                      child: Text(LocaleKeys.sign_up.tr(),
                          style: AppStyles.styleSourceBold20(context)
                              .copyWith(color: kPrimaryColor, fontSize: 18)),
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kSignUp);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

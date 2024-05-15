import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/Auth/presentation/view/widgets/continue_with_google_button.dart';
import 'package:tourista/features/Auth/presentation/view/widgets/custom_authButton.dart';
import 'package:tourista/features/Auth/presentation/view/widgets/earth_logo.dart';
import 'package:tourista/features/Auth/presentation/view/widgets/or_divider.dart';
import 'package:tourista/features/Auth/presentation/view/widgets/password_text_field.dart';
import 'package:tourista/features/Auth/presentation/view/widgets/phone_number_text_field.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    Future signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              kSizedBox20h,
              const EartLogo(),
              kSizedBox20h,
              Text(
                LocaleKeys.sign_in_to_your_account.tr(),
                style: AppStyles.styleInterBold30(context)
                    .copyWith(color: kPrimaryColor),
              ),
              const SizedBox(
                height: 85,
              ),
              const PhoneNumberTextField(),
              kSizedBox30h,
              const PasswordTextField(),
              kSizedBox10h,
              GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .pushReplacement(AppRouter.kForgetPassword);
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
                height: screenheight * 0.12,
              ),
              const ORDivider(),
              kSizedBox20h,
              GoogleButton(
                onTap: () async {
                  await signInWithGoogle();
                  GoRouter.of(context).push(AppRouter.kForgetPassword);
                },
              ),
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
    );
  }
}

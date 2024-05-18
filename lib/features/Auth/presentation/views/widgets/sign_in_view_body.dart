import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/features/Auth/presentation/view_models/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:tourista/features/Auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:tourista/features/Auth/presentation/views/widgets/earth_logo_with_text.dart';
import 'package:tourista/features/Auth/presentation/views/widgets/forget_passord_button.dart';
import 'package:tourista/features/Auth/presentation/views/widgets/password_text_field.dart';
import 'package:tourista/features/Auth/presentation/views/widgets/taxt_with_text_button.dart';
import 'package:tourista/features/auth/presentation/views/widgets/continue_with_google_button.dart';
import 'package:tourista/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:tourista/features/auth/presentation/views/widgets/phone_number_text_field.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

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
            const PhoneNumberTextField(),
            Gap(screenheight * 0.04),
            const PasswordTextField(),
            Gap(screenheight * .005),
            const ForgetPasswordButton(),
            Gap(screenheight * 0.03),
            CustomAuthButton(
              text: LocaleKeys.sign_in.tr(),
              width: screenWidth * .80,
            ),
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
}

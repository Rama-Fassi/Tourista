import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/app_assets.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/styles.dart';
import 'package:tourista/features/Auth/presentation/view/widgets/continue_with_google_button.dart';
import 'package:tourista/features/Auth/presentation/view/widgets/custom_authButton.dart';
import 'package:tourista/features/Auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:tourista/features/Auth/presentation/view/widgets/earth_logo.dart';
import 'package:tourista/features/Auth/presentation/view/widgets/or_divider.dart';
import 'package:tourista/features/Auth/presentation/view/widgets/password_text_field.dart';
import 'package:tourista/features/Auth/presentation/view/widgets/phone_number_text_field.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

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
                kSizedBox20h,
                const EartLogo(),
                kSizedBox20h,
                Text(
                  LocaleKeys.create_an_account.tr(),
                  style: AppStyles.styleInterBold30(context)
                      .copyWith(color: kPrimaryColor),
                ),
                kSizedBox30h,
                const UserNameTextField(),
                kSizedBox30h,
                const PhoneNumberTextField(),
                kSizedBox30h,
                const PasswordTextField(),
                kSizedBox30h,
                CustomTextFormField(
                  color: kPrimaryColor,
                  icon: Padding(
                    padding: const EdgeInsets.all(11),
                    child: SvgPicture.asset(Assets.imagesIconsFillLock),
                  ),
                  hintText: LocaleKeys.confirm_password.tr(),
                ),
                kSizedBox40h,
                CustomAuthButton(
                  screenWidth: screenWidth,
                  text: LocaleKeys.sign_up.tr(),
                ),
                kSizedBox20h,
                const ORDivider(),
                kSizedBox20h,
                GoogleButton(),
                kSizedBox20h,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.already_have_an_account.tr(),
                      style: AppStyles.styleSourceSemiBold20(context)
                          .copyWith(color: Colors.black),
                    ),
                    //  kSizedBox5w,
                    TextButton(
                      child: Text(LocaleKeys.sign_in.tr(),
                          style: AppStyles.styleSourceBold20(context)
                              .copyWith(color: kPrimaryColor, fontSize: 18)),
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kSignIN);
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

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      color: kPrimaryColor,
      icon: Padding(
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          Assets.imagesIconsPerson,
        ),
      ),
      hintText: LocaleKeys.user_name.tr(),
    );
  }
}

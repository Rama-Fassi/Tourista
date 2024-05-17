import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/features/forget_password/presentation/views/forget_password.dart';
import 'package:tourista/features/auth/presentation/views/sign_in_view.dart';
import 'package:tourista/features/auth/presentation/views/sign_up_view.dart';
import 'package:tourista/features/forget_password/presentation/views/reset_password_view.dart';
import 'package:tourista/features/forget_password/presentation/views/verify_view.dart';
import 'package:tourista/features/onboarding/views/onboarding_view.dart';
import 'package:tourista/features/splash/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kSignUp = '/signUpView';
  static const kSignIN = '/signINView';
  static const kForgetPassword = '/forgetPasswordView';
  static const kOnboarduingView = '/onboardingView';
  static const kVerifyView = '/verifyView';
  static const kResetPassword = '/resetPassword';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kSignUp,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: const SignUPView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kOnboarduingView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: const OnboardingView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kSignIN,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: kForgetPassword,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: kVerifyView,
        builder: (context, state) => VerifyView(
          appBarText: LocaleKeys.forgetPassword.tr(),
        ),
      ),
      GoRoute(
          path: kResetPassword,
          builder: (context, state) => const ResetPasswordView()),
    ],
  );
}

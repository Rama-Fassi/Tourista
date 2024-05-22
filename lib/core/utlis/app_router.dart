import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/features/auth/forget_password/data/repos/forget_password_impl.dart';
import 'package:tourista/features/auth/forget_password/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:tourista/features/auth/forget_password/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:tourista/features/auth/forget_password/presentation/manager/verify_code_cubit/verify_code_cubit.dart';
import 'package:tourista/features/auth/forget_password/presentation/views/forget_password.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/repos/auth_repo_impl.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/sign_in_view.dart';
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/sign_up_view.dart';
import 'package:tourista/features/auth/forget_password/presentation/views/reset_password_view.dart';
import 'package:tourista/features/auth/forget_password/presentation/views/verify_view.dart';
import 'package:tourista/features/home/presentation/views/home_view.dart';
import 'package:tourista/features/onboarding/views/onboarding_view.dart';
import 'package:tourista/features/private_trip/main/presentation/views/private_trip_TapBar.dart';
import 'package:tourista/features/splash/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kSignUp = '/signUpView';
  static const kSignIN = '/signINView';
  static const kForgetPassword = '/forgetPasswordView';
  static const kOnboarduingView = '/onboardingView';
  static const kVerifyView = '/verifyView';
  static const kResetPassword = '/resetPassword';
  static const kPrivateTripTapBar = '/privateTreipTopB';

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
          child: BlocProvider(
            create: (context) => SignUpCubit(getIt.get<AuthRepoImpl>()),
            child: const SignUPView(),
          ),
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
        builder: (context, state) => BlocProvider(
          create: (context) => SignInCubit(getIt.get<AuthRepoImpl>()),
          child: const SignInView(),
        ),
      ),
      GoRoute(
        path: kForgetPassword,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              ForgetPasswordCubit(getIt.get<ForgetPasswordRepoImpl>()),
          child: const ForgetPasswordView(),
        ),
      ),
      GoRoute(
        path: kVerifyView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              VerifyCodeCubit(getIt.get<ForgetPasswordRepoImpl>()),
          child: VerifyView(
            number: state.extra as Map<String, dynamic>,
            appBarText: LocaleKeys.forgetPassword.tr(),
          ),
        ),
      ),
      GoRoute(
        path: kResetPassword,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              ResetPasswordCubit(getIt.get<ForgetPasswordRepoImpl>()),
          child: ResetPasswordView(
            userId: state.extra as int,
          ),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const NavigationBArScaffold(),
      ),
      GoRoute(
        path: kPrivateTripTapBar,
        builder: (context, state) => const PrivateTripTapBar(),
      ),
    ],
  );
}

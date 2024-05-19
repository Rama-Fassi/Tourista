import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/service_locateer.dart';
import 'package:tourista/features/Auth/data/repos/auth_repo_impl.dart';
import 'package:tourista/features/Auth/presentation/view_models/sign_in_cubit/sign_in_cubit.dart';
import 'package:tourista/features/Auth/presentation/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:tourista/features/home/presentation/views/home_view.dart';
import 'package:tourista/features/forget_password/presentation/views/forget_password.dart';
import 'package:tourista/features/auth/presentation/views/sign_in_view.dart';
import 'package:tourista/features/auth/presentation/views/sign_up_view.dart';
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
  static const kVerifySignUpView = '/verifySignUpView';

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
            create: (context) => SignUpCubit(
              getIt.get<AuthRepoImpl>(),
            ),
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
          create: (context) => SignInCubit(
            getIt.get<AuthRepoImpl>(),
          ),
          child: const SignInView(),
        ),
      ),
      GoRoute(
        path: kForgetPassword,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: kVerifyView,
        builder: (context, state) => const VerifyView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/translations/locale_keys.g.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/core/widgets/navigation_bar_scaffold.dart';
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
import 'package:tourista/features/auth/sign_in_and_up/presentation/views/verify_sign_up_view.dart';
import 'package:tourista/features/onboarding/views/onboarding_view.dart';
import 'package:tourista/features/private_trip/activities/data/models/tourism_activities/activity_model.dart';
import 'package:tourista/features/private_trip/activities/presentation/manager/activities_cubit/activities_cubit.dart';
import 'package:tourista/features/private_trip/flights/data/repos/flights_repo_impl.dart';
import 'package:tourista/features/private_trip/flights/presentation/manager/airport_where_from_cubit/airport_where_from_cubit.dart';
import 'package:tourista/features/private_trip/flights/presentation/manager/airport_where_to_cubit/airport_where_to_cubit.dart';
import 'package:tourista/features/private_trip/flights/presentation/manager/choose_ticket_cubit/choose_ticket_cubit.dart';
import 'package:tourista/features/private_trip/flights/presentation/manager/flights/flights_cubit.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/tickets_view.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/where_from_airport_view.dart';
import 'package:tourista/features/private_trip/flights/presentation/views/where_to_airport_view.dart';
import 'package:tourista/features/private_trip/main/data/models/create_trip_model/create_trip_model.dart';
import 'package:tourista/features/private_trip/main/data/repos/main_repo_impl.dart';
import 'package:tourista/features/private_trip/main/presentation/manager/all_city_cubit/all_city_cubit.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/activities_view.dart';
import 'package:tourista/features/private_trip/activities/presentation/views/activity_details_view.dart';
import 'package:tourista/features/private_trip/main/presentation/views/private_trip_TabBar.dart';
import 'package:tourista/features/private_trip/main/presentation/views/enter_destination_view.dart';
import 'package:tourista/features/private_trip/main/presentation/views/select_location_view.dart';
import 'package:tourista/features/splash/views/splash_view.dart';

import '../../features/private_trip/activities/data/repos/activities_repo_impl.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kSignUp = '/signUpView';
  static const kSignIN = '/signINView';
  static const kForgetPassword = '/forgetPasswordView';
  static const kOnboarduingView = '/onboardingView';
  static const kVerifyView = '/verifyView';
  static const kResetPassword = '/resetPassword';
  static const kPrivateTripTapBar = '/privateTreipTopB';
  static const kVerifySignUpView = '/verifySignUpView';
  static const kSelectLocationView = '/selectLocationView';
  static const kEnterDestinationView = '/enterDestinationView';
  static const kTicketsView = '/ticketsView';
  static const kWhereFromAirportView = '/whereFromAirportView';
  static const kWhereToAirportView = '/whereToAirportView';
  static const kActivitiesView = '/ActivitiesView';
  static const kActivityDetailsView = '/ActivityDetailsView';

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
        builder: (context, state) => BlocProvider(
          create: (context) => FlightsCubit(),
          child: PrivateTripTapBar(
            createTripModel: state.extra as CreateTripModel,
          ),
        ),
      ),
      GoRoute(
        path: kVerifySignUpView,
        builder: (context, state) => VerifySignUpView(
          signUpInfo: state.extra as Map<String, dynamic>,
        ),
      ),
      GoRoute(
        path: kSelectLocationView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: BlocProvider(
            create: (context) => AllCityCubit(getIt.get<MainRepoImpl>()),
            child: const SelectLocationView(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1), // Slide in from bottom
                end: const Offset(0, 0), // Slide up to top
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kEnterDestinationView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: BlocProvider(
            create: (context) => AllCityCubit(getIt.get<MainRepoImpl>()),
            child: const EnterDestinationView(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1), // Slide in from bottom
                end: const Offset(0, 0), // Slide up to top
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kWhereFromAirportView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: BlocProvider(
            create: (context) =>
                AirportWhereFromCubit(getIt.get<FlightsRepoImpl>())
                  ..getAirportFromCubitFun(cityId: state.extra as int),
            child: const WhereFromAirprotView(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1), // Slide in from bottom
                end: const Offset(0, 0), // Slide up to top
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kWhereToAirportView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: kTransitionDuration,
          child: BlocProvider(
            create: (context) =>
                AirportWhereToCubit(getIt.get<FlightsRepoImpl>())
                  ..getAirportToCubitFun(cityId: state.extra as int),
            child: const WhereToAirportView(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1), // Slide in from bottom
                end: const Offset(0, 0), // Slide up to top
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kTicketsView,
        builder: (context, state) => BlocProvider(
          create: (context) => ChooseTicketCubit(getIt.get<FlightsRepoImpl>()),
          child: TicketsView(
            ticketsinfo: state.extra as Map<String, dynamic>,
          ),
        ),
      ),
      GoRoute(
        path: kActivitiesView,
        builder: (context, state) => BlocProvider(
          create: (context) =>  ActivitiesCubit(getIt.get<ActivitiesRepoImpl>()),
          child:  ActivitiesView(tripId: state.extra as int,),
        ),
      ),
      GoRoute(
        path: kActivityDetailsView,
        builder: (context, state) =>  ActivityDetails(activityModel: state.extra as ActivityModel,),
      )
    ],
  );
}

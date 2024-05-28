import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/core/utlis/app_router.dart';
import 'package:tourista/core/utlis/functions/theme_data.dart';
import 'package:tourista/core/utlis/service_locator.dart';
import 'package:tourista/core/utlis/simple_bloc_observer.dart';
import 'package:tourista/features/private_trip/flights/presentation/manager/flights/flights_cubit.dart';
import 'package:tourista/firebase_options.dart';
import './core/translations/codegen_loader.g.dart';

void main() async {
  setUpServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(kOnboarding);
  await Hive.openBox(kTokenBox);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const Tourista(),
    ),
  );
}

class Tourista extends StatelessWidget {
  const Tourista({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlightsCubit(),
      child: MaterialApp.router(
        theme: themeData(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routerConfig: AppRouter.router,
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/auth/forget_password/data/repos/forget_password_impl.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/repos/auth_repo_impl.dart';
import 'package:tourista/features/private_trip/activities/data/repos/activities_repo_impl.dart';
import 'package:tourista/features/private_trip/flights/data/repos/flights_repo_impl.dart';
import 'package:tourista/features/private_trip/main/data/repos/main_repo_impl.dart';
import 'package:tourista/features/private_trip/stays/data/repos/stays_repo_impl.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiServer>(
    ApiServer(
      Dio(),
    ),
  );

  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt.get<ApiServer>(),
    ),
  );


   getIt.registerSingleton<ActivitiesRepoImpl>(
    ActivitiesRepoImpl(
      getIt.get<ApiServer>(),
    ),
  );

  getIt.registerSingleton<ForgetPasswordRepoImpl>(
    ForgetPasswordRepoImpl(
      getIt.get<ApiServer>(),
    ),
  );
  getIt.registerSingleton<MainRepoImpl>(
    MainRepoImpl(
      getIt.get<ApiServer>(),
    ),
  );
  getIt.registerSingleton<FlightsRepoImpl>(
    FlightsRepoImpl(
      getIt.get<ApiServer>(),
    ),
  );
  getIt.registerSingleton<StaysRepoImpl>(
    StaysRepoImpl(
      getIt.get<ApiServer>(),
    ),
  );
}

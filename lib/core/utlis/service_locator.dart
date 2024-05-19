import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/auth/data/repos/auth_repo_impl.dart';
import 'package:tourista/features/forget_password/data/repos/forget_password_impl.dart';

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
  getIt.registerSingleton<ForgetPasswordRepoImpl>(
    ForgetPasswordRepoImpl(
      getIt.get<ApiServer>(),
    ),
  );
}

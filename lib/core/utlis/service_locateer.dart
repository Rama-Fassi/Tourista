import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tourista/core/utlis/api_server.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiServer>(
    ApiServer(
      Dio(),
    ),
  );
}

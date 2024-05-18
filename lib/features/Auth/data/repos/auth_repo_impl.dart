import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_service.dart';
import 'package:tourista/features/Auth/data/models/register_model.dart';
import 'package:tourista/features/Auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  
  final ApiService apiService;

  AuthRepoImpl(this.apiService);

  @override
  Future<Either<Failure, RegisterModel>> signUp({
    required String name,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      var registerData =
          await apiService.post(endPoint: 'register', data: {
        "name": name,
        "phone": phone,
        "password": password,
        "password_confirmation": confirmPassword,
      });

      RegisterModel registerModel = RegisterModel.fromJson(registerData);

      return right(registerModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

 
}

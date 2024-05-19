import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/Auth/data/models/register_model.dart';
import 'package:tourista/features/Auth/data/models/sign_in_model.dart';
import 'package:tourista/features/Auth/data/models/verify_sign_up_model.dart';
import 'package:tourista/features/Auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiServer apiService;

  AuthRepoImpl(this.apiService);


  @override
  Future<Either<Failure, RegisterModel>> signUp({
    required String name,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      var registerData = await apiService.post(endPoint: 'register', data: {
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
  
  @override
  Future<Either<Failure, SignInModel>> signIn({required String phone, required String password}) async {
    try {
      var signInData = await apiService.post(endPoint: 'login', data: {
        "phone": phone,
        "password": password,
      });

      SignInModel signInModel = SignInModel.fromJson(signInData);

      return right(signInModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
    
  }

  @override
  Future<Either<Failure, VerifySignUpModel>> verifySignUp({required String userId, required String code}) async{
     try  {
      var verifySignUpData = await apiService.post(endPoint: 'verifyCode', data: {
        "user_id": userId,
        "code": code,
      });

      VerifySignUpModel verifySignUpModel = VerifySignUpModel.fromJson(verifySignUpData);

      return right(verifySignUpModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

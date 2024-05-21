import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      var registerData = await apiService.post(endPoint: 'register', body: {
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
  Future<Either<Failure, SignInModel>> signIn(
      {required String phone, required String password}) async {
    try {
      var signInData = await apiService.post(endPoint: 'login', body: {
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
  Future<Either<Failure, VerifySignUpModel>> verifySignUp(
      {required int userId, required String code}) async {
    try {
      var verifySignUpData =
          await apiService.post(endPoint: 'verifyCode', body: {
        "user_id": userId,
        "code": code,
      });

      VerifySignUpModel verifySignUpModel =
          VerifySignUpModel.fromJson(verifySignUpData);

      return right(verifySignUpModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
    } else {
      String? name = googleUser.displayName;
      String? email = googleUser.email;
      print(name);
      print(email);
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    String? accessToken = googleAuth?.accessToken;
    print(accessToken);
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  
  @override
  Future sentSignInWithGoogleInfo({String? userName, String? email, String? accessToken, String? idToken, String? userId}) {
    // TODO: implement sentSignInWithGoogleInfo
    throw UnimplementedError();
  }
}

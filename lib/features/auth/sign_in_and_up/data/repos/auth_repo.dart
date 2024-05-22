import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/models/register_model.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/models/sign_in_model.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/models/verify_sign_up_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, RegisterModel>> signUp({
    required String name,
    required String phone,
    required String password,
    required String confirmPassword,
  });

  Future<Either<Failure, SignInModel>> signIn({
    required String phone,
    required String password,
  });

  Future<Either<Failure, VerifySignUpModel>> verifySignUp({
    required int userId,
    required String code,
  });

  Future<UserCredential> signInWithGoogle();

  Future sentSignInWithGoogleInfo({
    String? userName,
    String? email,
    String? accessToken,
    String? idToken,
    String? userId,
  });
}

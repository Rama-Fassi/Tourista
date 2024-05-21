import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/features/Auth/data/models/register_model.dart';
import 'package:dartz/dartz.dart';
import 'package:tourista/features/Auth/data/models/sign_in_model.dart';
import 'package:tourista/features/Auth/data/models/verify_sign_up_model.dart';

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
}

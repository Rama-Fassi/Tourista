import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/features/Auth/data/models/register_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure,RegisterModel>> signUp({
    required String name,
    required String phone,
    required String password,
    required String confirmPassword,
  });

//Future  signInWithGoogle();

}

import 'package:tourista/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tourista/features/profile/data/models/delete_account_model.dart';


abstract class ProfileRepo {
  
  Future<Either<Failure, DeleteAccountModel>> deleteAccount({
    required String token,
  });

 
}

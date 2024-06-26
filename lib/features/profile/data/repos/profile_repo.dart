import 'package:tourista/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tourista/features/profile/data/models/delete_account_model.dart';
import 'package:tourista/features/profile/data/models/update_name_model.dart';


abstract class ProfileRepo {
  
  Future<Either<Failure, DeleteAccountModel>> deleteAccount({
    required String token,
  });

   Future<Either<Failure, UpdateNameModel>> updateName({
    required String token,
        required String name,

  });

 
}

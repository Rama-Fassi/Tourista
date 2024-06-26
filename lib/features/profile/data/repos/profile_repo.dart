import 'package:tourista/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:tourista/features/profile/data/models/delete_account_model.dart';
import 'package:tourista/features/profile/data/models/update_name_model.dart';
import 'package:tourista/features/profile/data/models/user_info_model/user_info_model.dart';
import 'package:tourista/features/profile/data/models/verify_new_phone_model.dart';

import '../models/update_phone_model.dart';


abstract class ProfileRepo {
  
  Future<Either<Failure, DeleteAccountModel>> deleteAccount({
    required String token,
  });

  Future<Either<Failure, UserInfoModel>> getUserInfo
({
    required String token,
  });

   Future<Either<Failure, UpdateNameModel>> updateName({
    required String token,
        required String name,

  });

     Future<Either<Failure, UpdatePhoneModel>> updatePhone({
    required String token,
        required String phone,

  });

       Future<Either<Failure, VerifyNewPhoneModel>> verifyNewPhone({
    required String token,
        required String phone,
                required String code,


  });

 
}

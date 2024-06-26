import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/profile/data/models/delete_account_model.dart';
import 'package:tourista/features/profile/data/models/update_name_model.dart';
import 'package:tourista/features/profile/data/models/update_phone_model.dart';
import 'package:tourista/features/profile/data/models/user_info_model/user_info_model.dart';
import 'package:tourista/features/profile/data/models/verify_new_phone_model.dart';

import 'profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiServer apiService;

  ProfileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, DeleteAccountModel>> deleteAccount(
      {required String token}) async {
    try {
      var deleteAccountData =
          await apiService.delete(endPoint: 'deleteAccount', token: token);

      DeleteAccountModel deleteAccountModel =
          DeleteAccountModel.fromJson(deleteAccountData);

      return right(deleteAccountModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UpdateNameModel>> updateName(
      {required String token, required String name}) async {
    try {
      var updateNameData = await apiService
          .post(endPoint: 'updateName', token: token, body: {'name': name});

      UpdateNameModel updateNameModel =
          UpdateNameModel.fromJson(updateNameData);

      return right(updateNameModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UpdatePhoneModel>> updatePhone(
      {required String token, required String phone}) async {
    try {
      var updatePhoneData = await apiService
          .post(endPoint: 'updatePhone', token: token, body: {'phone': phone});

      UpdatePhoneModel updatePhoneModel =
          UpdatePhoneModel.fromJson(updatePhoneData);

      return right(updatePhoneModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, VerifyNewPhoneModel>> verifyNewPhone(
      {required String token,
      required String phone,
      required String code}) async {
    try {
      var verifyNewPhoneData = await apiService.post(
          endPoint: 'verifyNewPhone',
          token: token,
          body: {'phone': phone, 'code': code});

      VerifyNewPhoneModel verifyNewPhoneModel =
          VerifyNewPhoneModel.fromJson(verifyNewPhoneData);

      return right(verifyNewPhoneModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserInfoModel>> getUserInfo({required String token}) async {
    try {
      var userInfoData =
          await apiService.get(endPoint: 'userInfo', token: token);

      UserInfoModel userInfoModel =
          UserInfoModel.fromJson(userInfoData);

      return right(userInfoModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

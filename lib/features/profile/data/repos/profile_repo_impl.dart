import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tourista/core/errors/failures.dart';
import 'package:tourista/core/utlis/api_server.dart';
import 'package:tourista/features/profile/data/models/delete_account_model.dart';
import 'package:tourista/features/profile/data/models/update_name_model.dart';

import 'profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiServer apiService;

  ProfileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, DeleteAccountModel>> deleteAccount(
      {required String token}) async {
    try {
      var deleteAccountData = await apiService.delete(
          endPoint: 'deleteAccount',
          token: token); 

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
  Future<Either<Failure, UpdateNameModel>> updateName({required String token, required String name}) async {
    try {
      var updateNameData = await apiService.post(
          endPoint: 'updateName',
          token: token, body: {

            'name' : name
          }); 

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
}

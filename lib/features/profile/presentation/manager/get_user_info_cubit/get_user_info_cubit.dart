import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import '../../../../../constants.dart';
import '../../../data/models/user_info_model/user_info_model.dart';
import '../../../data/repos/profile_repo.dart';
part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit(this.profileRepo) : super(GetUserInfoInitial());

  final ProfileRepo profileRepo;

  Future<void> getUserInfo() async {
    emit(GetUserInfoLoading());
    var result = await profileRepo.getUserInfo(
        token: Hive.box(kTokenBox).get(kTokenRef));

    result.fold((failure) {
      emit(GetUserInfoFailure(failure.errMessage));
      if (kDebugMode) {
        print(failure.errMessage.toString());
      }
    }, (userInfoModel) {
      Hive.box(kUserInfoBox).put(kUserPointsRef, userInfoModel.user!.points);
      if (kDebugMode) {
        print('points: ${Hive.box(kUserInfoBox).get(kUserPointsRef)}');
      }
      Hive.box(kUserInfoBox).put(kUserWalletRef, userInfoModel.user!.wallet);
      if (kDebugMode) {
        print('wallet: ${Hive.box(kUserInfoBox).get(kUserWalletRef)}');
      }
      Hive.box(kUserInfoBox).put(kUserNameRef, userInfoModel.user!.name);
      if (kDebugMode) {
        print('username: ${Hive.box(kUserInfoBox).get(kUserNameRef)}');
      }
      Hive.box(kUserInfoBox)
          .put(kUserPhoneRef, userInfoModel.user?.normalUser?.phone);
      if (kDebugMode) {
        print('phoneNumber: ${Hive.box(kUserInfoBox).get(kUserPhoneRef)}');
      }
      userInfoModel.user?.googleUser != null
          ? Hive.box(kUserInfoBox)
              .put(kUserEmailRef, userInfoModel.user!.googleUser!.email)
          : Hive.box(kUserInfoBox).put(kUserEmailRef, null);
      if (kDebugMode) {
        print('email: ${Hive.box(kUserInfoBox).get(kUserEmailRef)}');
      }
      emit(GetUserInfoSuccess(userInfoModel));
    });
  }
}

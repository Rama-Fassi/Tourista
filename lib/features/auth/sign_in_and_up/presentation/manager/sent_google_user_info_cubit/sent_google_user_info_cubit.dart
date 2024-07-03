import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../../../../constants.dart';
import '../../../data/models/sign_in_with_google_model.dart';
import '../../../data/repos/auth_repo.dart';

part 'sent_google_user_info_state.dart';

class SentgoogleuserinfoCubit extends Cubit<SentGoogleUserInfoState> {
  SentgoogleuserinfoCubit(this.authRepo) : super(SentGoogleUserInfoInitial());


    final AuthRepo authRepo;
    
  Future<void> sentSignInWithGoogleUserInfo({
    required String nama,
    required String email,
      required  String googleUserId,

  }) async {
    emit(SentGoogleUserInfoLoading());
    var result = await authRepo.sentSignInWithGoogleUserInfo(name: nama, email: email, googleUserId: googleUserId);

    result.fold((failure) {
      emit(SentGoogleUserInfoFailure(failure.errMessage));
    }, (signInWithGoogleModel) {
     Hive.box(kTokenBox).put(kTokenRef, signInWithGoogleModel.token);
     if (kDebugMode) {
       print(Hive.box(kTokenBox).get(kTokenRef));
     }
      emit(SentGoogleUserInfoSuccess(signInWithGoogleModel));
    });
  }
}


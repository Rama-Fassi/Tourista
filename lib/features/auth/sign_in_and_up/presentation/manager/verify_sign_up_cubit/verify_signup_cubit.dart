import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:tourista/constants.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/models/verify_sign_up_model.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/repos/auth_repo.dart';

part 'verify_signup_state.dart';

class VerifySignUpCubit extends Cubit<VerifySignUpState> {
  VerifySignUpCubit(this.authRepo) : super(VerifySignupInitial());

  final AuthRepo authRepo;

  Future<void> verifySignUp({required int userId, required String code}) async {
    emit(VerifySignupLoading());
    var result = await authRepo.verifySignUp(userId: userId, code: code);
    result.fold((failure) {
      emit(VerifySignupFailure(failure.errMessage));
    }, (verifySignUpModel) {
      Hive.box(kToken).put(kTokenRef, verifySignUpModel.token);
      print(Hive.box(kToken).get(kTokenRef));
      emit(VerifySignupSuccess(verifySignUpModel: verifySignUpModel));
    });
  }
}
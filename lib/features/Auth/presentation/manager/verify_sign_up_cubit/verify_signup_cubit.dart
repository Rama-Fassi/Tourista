import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/features/Auth/data/models/verify_sign_up_model.dart';
import 'package:tourista/features/Auth/data/repos/auth_repo.dart';

part 'verify_signup_state.dart';

class VerifySignUpCubit extends Cubit<VerifySignUpState> {
  VerifySignUpCubit(this.authRepo) : super(VerifySignupInitial());

  final AuthRepo authRepo;

  Future<void> verifySignUp(
      {required int userId, required String code}) async {
    emit(VerifySignupLoading());
    var result = await authRepo.verifySignUp(userId: userId, code: code);
    result.fold((failure) {
      emit(VerifySignupFailure(failure.errMessage));
    }, (verifySignUpModel) {
      emit(VerifySignupSuccess(verifySignUpModel: verifySignUpModel));
    });
  }
}

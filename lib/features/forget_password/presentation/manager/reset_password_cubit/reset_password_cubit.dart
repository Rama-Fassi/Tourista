import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourista/features/forget_password/data/models/reset_password_model.dart';
import 'package:tourista/features/forget_password/data/repos/forget_password_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.forgetPasswordRepo) : super(ResetPasswordInitial());
  final ForgetPasswordRepo forgetPasswordRepo;
  Future<void> resetPasswordCubitFun(
      {required String password,
      required String confirmPassword,
      required int userId}) async {
    emit(ResetPasswordLoading());
    var result = await forgetPasswordRepo.resetPassword(
        userId: userId, password: password, confirmPassword: confirmPassword);
    result.fold((failure) {
      emit(ResetPasswordFailure(errMessage: failure.errMessage));
    }, (resetPasswordModel) {
      emit(ResetPasswordSuccess(resetPasswordModel: resetPasswordModel));
    });
  }
}

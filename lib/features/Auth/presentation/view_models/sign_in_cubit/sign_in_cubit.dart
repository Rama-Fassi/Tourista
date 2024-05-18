import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tourista/features/Auth/data/models/sign_in_model.dart';
import 'package:tourista/features/Auth/data/repos/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());


  final AuthRepo authRepo;

   signIn({
    required String phone,
    required String password,
  }) async {
    emit(SignInLoading());
    var result = await authRepo.signIn( phone: phone, password: password);
    result.fold((failure) {
      emit(SignInFailure(failure.errMessage));
    }, (signInModel) {
      emit(SignInSuccess(signInModel: signInModel ));
    });
  }
}

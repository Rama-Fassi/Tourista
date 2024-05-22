import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/repos/auth_repo.dart';

part 'sign_in_with_google_state.dart';

class SignInWithGoogleCubit extends Cubit<SignInWithGoogleState> {
  SignInWithGoogleCubit(this.authRepo) : super(SignInWithGoogleInitial());

  final AuthRepo authRepo;
}

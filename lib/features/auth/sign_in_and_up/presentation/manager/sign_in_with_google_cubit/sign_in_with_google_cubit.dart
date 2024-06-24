import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/repos/auth_repo.dart';

part 'sign_in_with_google_state.dart';
class SignInWithGoogleCubit extends Cubit<SignInWithGoogleState> {
  SignInWithGoogleCubit(this.authRepo) : super(SignInWithGoogleInitial());

  final AuthRepo authRepo;

  Future<void> signInWithGoogle() async {
    try {
      emit(SignInWithGoogleLoading());
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        try {
          await authRepo.sentSignInWithGoogleUserInfo(
            email: googleUser.email,
            name: googleUser.displayName!,
            googleUserId: googleUser.id,
          );
          emit(SignInWithGoogleSuccess(googleUser: googleUser));
        } catch (e) {
          emit(SignInWithGoogleFailure('Error sending user info to server'));
        }
      } else {
        emit(SignInWithGoogleFailure('Google Sign-In failed'));
      }
    } catch (e) {
      emit(SignInWithGoogleFailure('An error occurred during Google Sign-In'));
    }
  }
}
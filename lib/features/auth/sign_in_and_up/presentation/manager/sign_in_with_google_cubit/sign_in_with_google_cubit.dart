import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tourista/features/auth/sign_in_and_up/data/repos/auth_repo.dart';

part 'sign_in_with_google_state.dart';

class SignInWithGoogleCubit extends Cubit<SignInWithGoogleState> {
  SignInWithGoogleCubit(this.authRepo) : super(SignInWithGoogleInitial());

  final AuthRepo authRepo;

  Future<void> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

    try {
      emit(SignInWithGoogleLoading());
      await googleSignIn.signOut(); // Sign out any previously signed-in user

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      //   final GoogleSignInAuthentication? googleAuth =
      //      await googleUser?.authentication;
      // Create a new credential
      //    final credential = GoogleAuthProvider.credential(
      //  accessToken: googleAuth?.accessToken,
      //      idToken: googleAuth?.idToken,
      //    );

      // Once signed in, return the UserCredential
      //  await FirebaseAuth.instance.signInWithCredential(credential);
      if (googleUser != null) {
        try {
          emit(SignInWithGoogleSuccess(googleUser: googleUser));
        } catch (e) {
          emit(SignInWithGoogleFailure('Error sending user info to server'));
        }
      } else {
        emit(SignInWithGoogleFailure('Google Sign-In failed'));
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error during Google Sign-In: $e');
      }

      emit(SignInWithGoogleFailure('An error occurred during Google Sign-In'));
    }
  }
}



/*
Future<void> sentSignInWithGoogleUserInfo({
  required String nama,
  required String email,
  required String googleUserId,
}) async {
  emit(SentGoogleUserInfoLoading());
  var result = await authRepo.sentSignInWithGoogleUserInfo(
    name: nama,
    email: email,
    googleUserId: googleUserId,
  );

  result.fold(
    (failure) {
      if (failure.errMessage.contains('email-already-in-use')) {
        // Handle email already taken case
        await _signInWithExistingEmail(email, googleUserId);
      } else {
        emit(SentGoogleUserInfoFailure(failure.errMessage));
        print(failure.errMessage.toString());
      }
    },
    (signInWithGoogleModel) {
      Hive.box(kTokenBox).put(kTokenRef, signInWithGoogleModel.token);
      Hive.box(kUserInfoBox).deleteAll([kUserNameRef, kUserPhoneRef]);

      if (kDebugMode) {
        print(Hive.box(kTokenBox).get(kTokenRef));
      }
      emit(SentGoogleUserInfoSuccess(signInWithGoogleModel));
    },
  );
}

Future<void> _signInWithExistingEmail(String email, String googleUserId) async {
  try {
    // Sign in the user with the existing email
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: googleUserId, // Use the Google user ID as the password
    );

    // Update the user's information
    await authRepo.updateUserInfo(
      name: credential.user?.displayName ?? '',
      email: credential.user?.email ?? '',
      googleUserId: credential.user?.uid ?? '',
    );

    // Emit the success state
    emit(SentGoogleUserInfoSuccess(
      SignInWithGoogleModel(
        token: await credential.user?.getIdToken(),
      ),
    ));
  } catch (e) {
    // Handle any errors that occur during the sign-in process
    emit(SentGoogleUserInfoFailure('Error signing in with existing email: $e'));
  }
}*/
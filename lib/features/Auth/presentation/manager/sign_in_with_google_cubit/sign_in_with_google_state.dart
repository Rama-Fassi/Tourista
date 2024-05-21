part of 'sign_in_with_google_cubit.dart';

sealed class SignInWithGoogleState extends Equatable {
  const SignInWithGoogleState();

  @override
  List<Object> get props => [];
}

final class SignInWithGoogleInitial extends SignInWithGoogleState {}

class SignInWithGoogleLoading extends SignInWithGoogleState {}

class SignInWithGoogleSuccess extends SignInWithGoogleState {
  
}

class SignInWithGoogleFailure extends SignInWithGoogleState {

}

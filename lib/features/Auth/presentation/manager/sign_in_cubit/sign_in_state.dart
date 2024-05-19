part of 'sign_in_cubit.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final SignInModel signInModel;

  const SignInSuccess({required this.signInModel});
}

class SignInFailure extends SignInState {
  final String errMessage;

  const SignInFailure(this.errMessage);
}

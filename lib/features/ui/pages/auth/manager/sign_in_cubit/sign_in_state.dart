part of 'sign_in_cubit.dart';

abstract class SignInState {
  @override
  List<Object?> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SigninSuccess extends SignInState {
  final UserModel user;
  SigninSuccess(this.user);
}

class SignInFailure extends SignInState {
  final String error;
  SignInFailure(this.error);
}

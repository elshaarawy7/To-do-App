part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SingUpSuccess extends SignUpState {
  final UserModel user;
  SingUpSuccess(this.user);
}

final class SignUpFailure extends SignUpState {
  final String error;
  SignUpFailure(this.error);
}

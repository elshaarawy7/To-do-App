part of 'auth_cubit_cubit.dart';


abstract class LoginState {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserModel user;
  LoginSuccess(this.user);

}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);

}

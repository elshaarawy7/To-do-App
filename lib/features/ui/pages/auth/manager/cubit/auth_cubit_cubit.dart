import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/features/ui/pages/auth/model/user_model.dart';
import 'package:todo_app/features/ui/pages/auth/repo/auth_repo.dart';

part 'auth_cubit_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;

  LoginCubit(this.authRepo) : super(LoginInitial());

Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await authRepo.login(email: email, password: password);
    result.fold(
      (failure) => emit(LoginFailure(failure.errMassage)),
      (user) => emit(LoginSuccess(user)),
    );
    return result;
  }
}

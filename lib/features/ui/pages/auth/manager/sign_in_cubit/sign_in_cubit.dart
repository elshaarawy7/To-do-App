import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/features/ui/pages/auth/model/user_model.dart';
import 'package:todo_app/features/ui/pages/auth/repo/auth_repo.dart';

part 'sign_in_state.dart';

class SigninCubit extends Cubit<SignInState> {
  final AuthRepo authRepo;

  SigninCubit(this.authRepo) : super(SignInInitial());

  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    final result = await authRepo.login(email: email, password: password);
    result.fold(
      (failure) => emit(SignInFailure(failure.errMassage)),
      (user) => emit(SigninSuccess(user)),
    );
    return result;
  }
}

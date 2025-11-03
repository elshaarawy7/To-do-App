import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/features/ui/pages/auth/model/user_model.dart';
import 'package:todo_app/features/ui/pages/auth/repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo authRepo;
  Future<Either<Failure, UserModel>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    final result = await authRepo.register(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) => emit(SignUpFailure(failure.errMassage)),
      (user) => emit(SingUpSuccess(user)),
    );
    return result;
  }
}

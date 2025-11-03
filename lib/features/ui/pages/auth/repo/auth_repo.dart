import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/features/ui/pages/auth/model/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserModel>> register({
    required String email,
    required String password,
    required String name,
  });
}

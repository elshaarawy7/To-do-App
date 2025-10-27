import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/core/utils/api_service.dart';
import 'package:todo_app/features/ui/pages/auth/model/user_model.dart';
import 'package:todo_app/features/ui/pages/auth/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.post(
        endPoint: '/login',
        data: {'email': email, 'password': password},
      );
      return right(UserModel.fromJson(response));
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

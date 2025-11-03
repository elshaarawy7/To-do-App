import 'package:get_it/get_it.dart';
import 'package:todo_app/core/utils/api_service.dart';
import 'package:todo_app/features/ui/pages/auth/repo/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  getIt.registerLazySingleton<AuthRepoImpl>(
    () => AuthRepoImpl(apiService: getIt<ApiService>()),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/core/utils/setup.dart';
import 'package:todo_app/features/ui/pages/auth/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:todo_app/features/ui/pages/auth/manager/sign_up_cubit.dart/cubit/sign_up_cubit.dart';
import 'package:todo_app/features/ui/pages/auth/repo/auth_repo_impl.dart';

void main() {
  setupServiceLocator();
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SigninCubit(getIt<AuthRepoImpl>())),
        BlocProvider(create: (context) => SignUpCubit(getIt<AuthRepoImpl>())),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      ),
    );
  }
}

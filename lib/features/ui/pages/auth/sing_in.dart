import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/features/ui/pages/auth/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:todo_app/features/ui/widget/sign_in_bloc_consumer.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SigninCubit, SignInState>(
        listener: (context, state) {
          if (state is SigninSuccess) {
            context.go(AppRouter.kHomePage);
          } else if (state is SignInFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is SignInLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingInBlocConsumer();
        },
      ),
    );
  }
}


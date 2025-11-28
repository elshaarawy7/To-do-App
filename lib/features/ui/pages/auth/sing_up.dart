import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/features/ui/pages/auth/manager/sign_up_cubit.dart/cubit/sign_up_cubit.dart';
import 'package:todo_app/features/ui/widget/custem_batton.dart';
import 'package:todo_app/features/ui/widget/custem_text_filed.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SingUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Register Successful")),
            );
            context.go(AppRouter.kHomePage);
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return SingupBlocConsumer();
        },
      ),
    );
  }
}

class SingupBlocConsumer extends StatefulWidget {
  const SingupBlocConsumer({super.key});

  @override
  State<SingupBlocConsumer> createState() => _SingupBlocConsumerState();
}

class _SingupBlocConsumerState extends State<SingupBlocConsumer> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),

              IconButton(
                onPressed: () {
                  context.go(AppRouter.kSingInPage);
                },
                icon: Icon(Icons.arrow_back, size: 50, color: Colors.black),
              ),

              SizedBox(height: 20),

              Text(
                "Sing up",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              //  name and email and passowrd and adssred ,
              CustemTextFiled(
                controller: nameController,
                hintText: "enter your Name",
                icon: Icons.email_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter ypur Name ";
                  }
                  return null;
                },
              ),

              SizedBox(height: 10),
              CustemTextFiled(
                controller: emailController,
                hintText: "Email",
                icon: Icons.email_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter ypur email ";
                  }
                  return null;
                },
              ),

              SizedBox(height: 10),

              CustemTextFiled(
                controller: passwordController,
                obscureText: true,
                hintText: "Password",
                icon: Icons.lock,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter your password";
                  }
                  if (value.length < 6) {
                    return "password must be at least 6 characters";
                  }
                  return null;
                },
              ),

              SizedBox(height: 10),

              CustemTextFiled(
                controller: confirmPassword,
                hintText: "Confirm password",
                obscureText: true,
                icon: Icons.lock,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter your confirm password";
                  }
                  if (value.length < 6) {
                    return "password must be at least 6 characters";
                  }
                  if (value != passwordController.text) {
                    return "password does not match";
                  }
                  return null;
                },
              ),

              SizedBox(height: 10),

              // forget passowrd and remmber me
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "remmber me ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "forget passowrd ",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              // batton
              CustemBatton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();
                    final name = nameController.text.trim();
                    context.read<SignUpCubit>().register(
                      name: name,
                      email: email,
                      password: password,
                    );
                  }
                },
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "OR",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go(AppRouter.kSingInPage);
                    },
                    child: Text(
                      "Sing in",
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

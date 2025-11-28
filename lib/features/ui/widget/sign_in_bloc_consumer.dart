import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/features/ui/pages/auth/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:todo_app/features/ui/widget/custem_batton.dart';
import 'package:todo_app/features/ui/widget/custem_scoil_auth.dart';
import 'package:todo_app/features/ui/widget/custem_text_filed.dart';

class SingInBlocConsumer extends StatefulWidget {
  const SingInBlocConsumer({super.key});

  @override
  State<SingInBlocConsumer> createState() => _SingInBlocConsumerState();
}

class _SingInBlocConsumerState extends State<SingInBlocConsumer> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey, // ✅ هنا ضفنا الـ Form
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 200),
              const Text(
                "Sign in",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Email Field
              CustemTextFiled(
                controller: emailController,
                hintText: "Enter your email",
                icon: Icons.email_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Password Field
              CustemTextFiled(
                controller: passwordController,
                hintText: "Enter your password",
                icon: Icons.lock,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Remember me",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              CustemBatton(
                onPressed: () {
                  // ✅ نتحقق من الـ Form قبل الإرسال
                  if (_formKey.currentState!.validate()) {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();
                    context.read<SigninCubit>().login(
                      email: email,
                      password: password,
                    );
                    
                  }
                },
              ),
              const SizedBox(height: 30),
              const Align(
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
              const SizedBox(height: 10),
              CustemScoilAuth(
                image: 'assets/schliol/super g.png',
                text: 'Login with Google',
              ),
              const SizedBox(height: 10),
              CustemScoilAuth(
                image: 'assets/schliol/Group 18560.png',
                text: "Login with Facebook",
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go(AppRouter.kSingUP);
                    },
                    child: const Text(
                      "Sign up",
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

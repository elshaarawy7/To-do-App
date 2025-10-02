import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/features/ui/widget/custem_batton.dart';
import 'package:todo_app/features/ui/widget/custem_scoil_auth.dart';
import 'package:todo_app/features/ui/widget/custem_text_filed.dart';

class SingIn extends StatelessWidget {
  const SingIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 200),

              Text(
                "Sing in",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

              //  email and passowrd ,
              CustemTextFiled(
                hintText: "enter ypur email",
                icon: Icons.email_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter ypur email ";
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

              CustemTextFiled(
                hintText: "enter ypur password",
                icon: Icons.lock,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length > 6) {
                    return "please enter ypur password";
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

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
                  context.go(AppRouter.kHomePage);
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

              // sing in with facebook and google
              CustemScoilAuth(
                image: 'assets/schliol/super g.png',
                text: 'Login with Google',
              ),

              SizedBox(height: 10),

              CustemScoilAuth(
                image: 'assets/schliol/Group 18560.png',
                text: "Login with Facebook",
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
                      context.go(AppRouter.kSingUP);
                    },
                    child: Text(
                      "Sing up",
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

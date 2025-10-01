import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/utils/app_router.dart';
import 'package:todo_app/futcher/ui/widget/custem_batton.dart';
import 'package:todo_app/futcher/ui/widget/custem_text_filed.dart';

class SingUp extends StatelessWidget {
  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                hintText: "enter ypur Name",
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
                hintText: "enter ypur email",
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
                hintText: "enter ypur password",
                icon: Icons.lock,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length > 6) {
                    return "please enter ypur password";
                  }
                  return null;
                },
              ),

              SizedBox(height: 10),

              CustemTextFiled(
                hintText: "Confirm password",
                icon: Icons.lock,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length > 6) {
                    return "please enter ypur Confirm password";
                  }
                  return null;
                },
              ),

              SizedBox(height: 10),

              CustemTextFiled(
                hintText: "Confirm addreas",
                icon: Icons.location_city_sharp,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length > 6) {
                    return "please enter ypur addreas";
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
              CustemBatton(),

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

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController usernameController = TextEditingController();
TextEditingController email_mobile_number_Controller = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text("User Name")),
              controller: usernameController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration:
                  const InputDecoration(label: Text("Email/Phone number")),
              controller: email_mobile_number_Controller,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text("Password")),
              controller: passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration:
                  const InputDecoration(label: Text("Confirm Password")),
              controller: confirmPasswordController,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.red,
                    fixedSize: Size(width, height * 0.06)),
                child: const Text(
                  "Sign up",
                  style: TextStyle(fontSize: 18, letterSpacing: 1),
                ))
          ],
        ),
      ),
    );
  }
}

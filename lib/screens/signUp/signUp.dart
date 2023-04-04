// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:red_drop/controllers/ApiController.dart';
import 'package:red_drop/screens/LandingPage.dart';
import 'package:red_drop/screens/signIn/signIn.dart';

import '../../controllers/ApiConstants.dart';
import '../../models/loginModel.dart';
import '../../models/signupModel.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();
SignUpModel registeredDetails = SignUpModel();
signUp(context, name, email, phone, password) async {
  var data = {
    "name": name,
    "email": email,
    "phone": phone,
    "password": password
  };
  var response =
      await ApiController.post(ApiConstants().registerApi, jsonEncode(data));
  registeredDetails = SignUpModel.fromJson(response);

  if (registeredDetails.flag == "T") {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(registeredDetails.status.toString()),
    ));
    return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LandingPage(),
        ));
  } else {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(registeredDetails.status.toString()),
    ));
  }
}

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
              decoration: const InputDecoration(label: Text("Name")),
              controller: nameController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text("Email")),
              controller: emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text("Phone number")),
              controller: phoneController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text("Password")),
              controller: passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  signUp(
                      context,
                      nameController.text.trim(),
                      emailController.text.trim(),
                      phoneController.text.trim(),
                      passwordController.text.trim());
                },
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

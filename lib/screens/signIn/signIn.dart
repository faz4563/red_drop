import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:red_drop/controllers/ApiConstants.dart';
import 'package:red_drop/controllers/ApiController.dart';
import 'package:red_drop/models/loginModel.dart';
import 'package:red_drop/screens/LandingPage.dart';
import 'package:red_drop/screens/homeScreen/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/localStorageControllers.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
LoginModel loggedInDetails = LoginModel();

login(context) async {
  var data = {
    "name": usernameController.text,
    "password": passwordController.text
  };
  var response =
      await ApiController.post(ApiConstants.loginApi, jsonEncode(data));
  loggedInDetails = LoginModel.fromJson(response);

  if (loggedInDetails.flag == "T") {
    usernameController.clear();
    passwordController.clear();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(loggedInDetails.status.toString()),
    ));
    LocalStorage.saveStringtoLocalStorage("loggedIn", "true");
    return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
  } else {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(loggedInDetails.status.toString()),
    ));
  }
}

class _SignInState extends State<SignIn> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
              decoration:
                  const InputDecoration(label: Text("Email / Phone number")),
              controller: usernameController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text("Password")),
              controller: passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password ?",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  login(context);
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.red,
                    fixedSize: Size(width, height * 0.06)),
                child: const Text(
                  "Sign in",
                  style: TextStyle(fontSize: 18, letterSpacing: 1),
                ))
          ],
        ),
      ),
    );
  }
}

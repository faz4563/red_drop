// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:red_drop/utils/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                loginImg,
                fit: BoxFit.contain,
                width: 200,
              ),
              radius: 150,
            )
          ],
        ),
      )),
    );
  }
}

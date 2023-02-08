// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:red_drop/screens/LandingPage.dart';
import 'package:red_drop/screens/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/localStorageControllers.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool skippedIntro = false;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    Future skippedIntro = LocalStorage.getBooltoLocalStorage("skippedIntro");
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(365, 667),
      builder: (context, child) => MaterialApp(
        title: 'RED DROP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            skippedIntro == false ? const IntroScreens() : const LoginScreen(),
      ),
    );
  }
}

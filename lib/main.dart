// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:red_drop/screens/LandingPage.dart';
import 'package:red_drop/screens/homeScreen/homePage.dart';
import 'package:red_drop/screens/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? skippedIntro;
  String? loggedIn;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    gettingSkippedData();
  }

  gettingSkippedData() async {
    final prefs = await SharedPreferences.getInstance();
    skippedIntro = prefs.getString("skippedIntro");
    loggedIn = prefs.getString("loggedIn");
    setState(() {});
    print(skippedIntro);
  }

  navigating() {
    if (skippedIntro == "true" && loggedIn == "true") {
      return const HomeScreen();
    } else if (skippedIntro == "false" && loggedIn == "false") {
      return const IntroScreens();
    } else if (skippedIntro == null && loggedIn == null) {
      return const IntroScreens();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(365, 667),
      builder: (context, child) => MaterialApp(
        title: 'RED DROP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: navigating(),
      ),
    );
  }
}

// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:red_drop/screens/signUp/signUp.dart';
import 'package:red_drop/utils/images.dart';
import 'signIn/signIn.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            width: width,
            height: height,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, border: Border.all()),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 62, 255, 239),
                      radius: 110,
                      child: Image.asset(
                        loginImg,
                        fit: BoxFit.contain,
                        width: 180,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DefaultTabController(
                    length: 2,
                    child: Expanded(
                      child: SizedBox(
                        width: width,
                        height: height,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.06,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: TabBar(
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    labelColor: Colors.black,
                                    indicatorColor: Colors.black,
                                    unselectedLabelColor: Colors.white,
                                    labelStyle: TextStyle(color: Colors.black),
                                    indicator: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    tabs: [
                                      SizedBox(
                                        width: 80,
                                        height: 30,
                                        child: Center(
                                            child: Text(
                                          "Sign In",
                                          style: TextStyle(
                                              fontSize: 18,
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.w600),
                                        )),
                                      ),
                                      SizedBox(
                                        width: 80,
                                        height: 30,
                                        child: Center(
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 1),
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: width,
                                  height: height,
                                  child: TabBarView(children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SignIn(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: SignUp(),
                                    )
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

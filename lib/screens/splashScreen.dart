// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:red_drop/controllers/localStorageControllers.dart';
import 'package:red_drop/screens/LoginPage.dart';
import 'package:red_drop/utils/images.dart';
import 'package:red_drop/utils/strings.dart';

class IntroScreens extends StatelessWidget {
  const IntroScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return const Banner1();
  }
}

class Banner1 extends StatelessWidget {
  const Banner1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: 365.w,
        height: 667.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 500,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(bannerImage1), fit: BoxFit.fitHeight)),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 181, 27, 16),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(120),
                        topRight: Radius.circular(120))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bannerTitleText1,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 30.h,
                          letterSpacing: 1),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 280.w,
                      child: Text(
                        bannerTitleText2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            letterSpacing: 0.1,
                            height: 1.5,
                            fontSize: 14.h),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Banner2(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(100.w, 25.h),
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          side: const BorderSide(color: Colors.black),
                          backgroundColor: Colors.white),
                      child: const Text(
                        "NEXT",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            letterSpacing: 1),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          LocalStorage.saveStringtoLocalStorage(
                              "skippedIntro", "true");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        },
                        child: const Text(
                          "Skip",
                          style:
                              TextStyle(color: Colors.white, letterSpacing: 1),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Banner2 extends StatelessWidget {
  const Banner2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: 365.w,
        height: 667.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 500,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(bannerImage2), fit: BoxFit.fitHeight)),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 181, 27, 16),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(120),
                        topRight: Radius.circular(120))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bannerTitleText3,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 30.h,
                          letterSpacing: 1),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 280.w,
                      child: Text(
                        bannerTitleText4,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            letterSpacing: 0.1,
                            height: 1.5,
                            fontSize: 14.h),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Banner3(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(100.w, 25.h),
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          side: const BorderSide(color: Colors.black),
                          backgroundColor: Colors.white),
                      child: const Text(
                        "NEXT",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            letterSpacing: 1),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          LocalStorage.saveStringtoLocalStorage(
                              "skippedIntro", "true");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        },
                        child: const Text(
                          "Skip",
                          style:
                              TextStyle(color: Colors.white, letterSpacing: 1),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Banner3 extends StatelessWidget {
  const Banner3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: 365.w,
        height: 667.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 500,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(bannerImage3), fit: BoxFit.fitHeight)),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 181, 27, 16),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(120),
                        topRight: Radius.circular(120))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bannerTitleText5,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 30.h,
                          letterSpacing: 1),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 280.w,
                      child: Text(
                        bannerTitleText6,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            letterSpacing: 0.1,
                            height: 1.5,
                            fontSize: 14.h),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(100.w, 25.h),
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          side: const BorderSide(color: Colors.black),
                          backgroundColor: Colors.white),
                      child: const Text(
                        "DONE",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            letterSpacing: 1),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          LocalStorage.saveStringtoLocalStorage(
                              "skippedIntro", "true");
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        },
                        child: const Text(
                          "Skip",
                          style:
                              TextStyle(color: Colors.white, letterSpacing: 1),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

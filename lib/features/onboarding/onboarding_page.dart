import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_books/features/auth/auth_gate.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Welcome to xxxx App",
              style: TextStyle(
                color: Colors.black,
                fontSize: 27,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Keep all your Media reviews in one place!",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              // child: Image.asset('assets/onboardIcon.png'),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12, blurRadius: 5, spreadRadius: 2)
                    ],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        "Review all movies, TV series, books and video games that you seen or read",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        color: Colors.white,
                        elevation: 2,
                        onPressed: () {
                          Get.to(() => const AuthGate());
                        },
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff274560),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

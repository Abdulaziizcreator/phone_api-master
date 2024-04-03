import 'dart:async';

import 'package:flutter/material.dart';

import 'package:phone_api/singn_up/sign_up(reg).dart';

import '../pages/bottomNavBar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = true;

  void _myTimer() {
    Timer(const Duration(seconds: 3), () {
      if (isLoggedIn == true) {
        Navigator.pushReplacementNamed(context, SignUpPage.id);
      } else {
        Navigator.pushReplacementNamed(context, BottomNavBar.id);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFEB096),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(child: Container()),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: AssetImage("assets/images/splash.jpg"),
                        fit: BoxFit.cover,
                      )),
                  height: 200,
                  width: 200,
                ),
              ),
              Expanded(child: Container()),
              const Text(
                "Powered by Abdulaziz",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "homePage",
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
        ));
  }
}

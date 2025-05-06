import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_profile/screens/home_screen.dart';
import 'package:multi_profile/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      isLogin();
    });
  }

  Future<void> isLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    bool isLogin = pref.getBool('isLogin') ?? false;
    if (isLogin == true) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image(image: AssetImage('assets/app_logo.png'))),
    );
  }
}

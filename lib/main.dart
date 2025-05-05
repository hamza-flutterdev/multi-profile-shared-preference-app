import 'package:flutter/material.dart';
import 'package:multi_profile/screens/splash_screen.dart';

void main() {
  runApp(const MultiProfile());
}

class MultiProfile extends StatelessWidget {
  const MultiProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi Profile',
      home: SplashScreen(),
    );
  }
}

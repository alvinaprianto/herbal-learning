import 'package:flutter/material.dart';
import 'package:hele/core/navigation_screen.dart';
import 'package:hele/features/detection/screens/scan_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();
    Future.delayed(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => NavigationScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/test.gif',
          width: MediaQuery.of(context).size.width * 0.6,
        ),
      ),
    );
  }
}

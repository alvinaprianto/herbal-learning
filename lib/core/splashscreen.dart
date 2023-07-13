import 'package:flutter/material.dart';
import 'package:hele/core/constants/image_constant.dart';
import 'package:hele/core/navigation_screen.dart';



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
        Duration(seconds: 6),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => NavigationScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          ImageConstant.splashLogo,
          width: MediaQuery.of(context).size.width * 0.6,
        ),
      ),
    );
  }
}

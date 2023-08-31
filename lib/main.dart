import 'package:flutter/material.dart';
import 'package:hele/core/splashscreen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:tflite/tflite.dart';
void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hele',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

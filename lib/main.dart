import 'package:expenz_app/screens/onbording%20screens/onbording_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Inter",
      ),
      debugShowCheckedModeBanner: false,
      home: OnbordingScreens(),
    );
  }
}

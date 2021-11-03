import 'package:flutter/material.dart';
import 'package:flutter_app/screens/customsplash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomSplashScreen(),
      theme: ThemeData(fontFamily: "Game Of Squids"),
    );
  }
}

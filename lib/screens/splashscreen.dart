import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 4,
        navigateAfterSeconds: new MyHomePage(),
        title: new Text('Welcome In Flutter Training'),
        image: new Image.asset('gambar/ina.jpeg'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red);
  }
}

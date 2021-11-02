import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/beranda_screen.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';

class CustomSplashScreen extends StatefulWidget {
  const CustomSplashScreen({Key? key}) : super(key: key);

  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cekKondisi();
  }

  cekKondisi() {
    var duration = Duration(seconds: 4);
    return Timer(duration, () async {
      //untuk pemindahan halaman

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Aplikasi Bank KalSel",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Image.network(
              "https://smart-fl.bankkalsel.co.id/assets/images/logo.png",
            ),
            SizedBox(
              height: 150,
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: 40,
            ),
            Text("Loading.....")
          ],
        ),
      ),
    );
  }
}

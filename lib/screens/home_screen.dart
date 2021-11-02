import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //scaffold(halaman) == activity di android
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        leading: Icon(Icons.home),
        title: Text("Aplikasi Flutter",
            style: TextStyle(
                color: Colors.yellow,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
              onPressed: () {
                print("ditekan");
              },
              icon: Icon(
                Icons.email,
                color: Colors.yellow[600],
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "gambar/kalsel.jpeg",
                width: double.infinity,
                height: 250,
                fit: BoxFit.fill,
              ),

              Image.network(
                "https://smart-fl.bankkalsel.co.id/assets/images/logo.png",
                width: 300,
                color: Colors.blue,
              ),
              // Text(
              //   "Hello World",
              //   style: TextStyle(fontSize: 25),
              // ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "gambar/ina.jpeg",
                width: 100,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Inatechno Official",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

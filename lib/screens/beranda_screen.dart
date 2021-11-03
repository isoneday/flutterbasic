import 'package:flutter/material.dart';
import 'package:flutter_app/screens/berita_screen.dart';
import 'package:flutter_app/screens/camera_screen.dart';
import 'package:flutter_app/screens/database_screen.dart';
import 'package:flutter_app/screens/gridwisata_screen.dart';
import 'package:flutter_app/screens/listwisata_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/screens/tab_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beranda"),
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
                pref.clear();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                tampilanMenu("list wisata", "gambar/bg2.png", Colors.blue,
                    context, ListWisataScreen()),
                SizedBox(
                  width: 10,
                ),
                tampilanMenu("grid wisata", "gambar/bg1.png", Colors.yellow,
                    context, GridWisataScreen())
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                tampilanMenu("Camera", "gambar/bg1.png", Colors.yellow, context,
                    CameraScreen()),
                SizedBox(
                  width: 10,
                ),
                tampilanMenu("Berita", "gambar/bg2.png", Colors.blue, context,
                    BeritaScreen())
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                tampilanMenu("SqliteDB", "gambar/bg1.png", Colors.blue, context,
                    DatabaseScreen()),
                tampilanMenu("Tab", "gambar/bg2.png", Colors.yellow, context,
                    TabScreen())
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget tampilanMenu(String title, String nameImage, Color color,
    BuildContext context, Widget kelasTujuan) {
  return Flexible(
    child: GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => kelasTujuan));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: color,
              // border: Border.all(width: 3, style: BorderStyle.solid),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  nameImage,
                  width: 150,
                  height: 150,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/listmakanan_screen.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beranda"),
      ),
      body: Column(
        children: [
          Flexible(
            child: Row(
              children: [
                tampilanMenu("list", "gambar/bg2.png", Colors.blue, context,
                    ListMakananScreen()),
                SizedBox(
                  width: 10,
                ),
                tampilanMenu("list", "gambar/bg1.png", Colors.yellow, context,
                    ListMakananScreen())
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                tampilanMenu("list", "gambar/bg1.png", Colors.yellow, context,
                    ListMakananScreen()),
                SizedBox(
                  width: 10,
                ),
                tampilanMenu("list", "gambar/bg2.png", Colors.blue, context,
                    ListMakananScreen())
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: [
                tampilanMenu("list", "gambar/bg1.png", Colors.blue, context,
                    ListMakananScreen()),
                tampilanMenu("list", "gambar/bg2.png", Colors.yellow, context,
                    ListMakananScreen())
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

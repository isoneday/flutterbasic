import 'package:flutter/material.dart';
import 'package:flutter_app/model/model_berita.dart';
import 'package:flutter_app/model/model_wisata.dart';
import 'package:flutter_app/screens/webberita_screen.dart';
import 'package:flutter_app/screens/webwisata_screen.dart';

class DetailBeritaScreen extends StatelessWidget {
  Articles? articles;
  DetailBeritaScreen({Key? key, this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Penulis : ${articles?.author ?? "-"}"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WebBeritaScreen(
                              articles: articles,
                            )));
              },
              icon: Icon(Icons.open_in_browser))
        ],
      ),
      body: Column(
        children: [
          Image.network(
            articles!.urlToImage!,
            width: double.infinity,
            height: 200,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            articles?.title ?? "-",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            articles?.description ?? "-",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/model_berita.dart';
import 'package:flutter_app/network/api.dart';
import 'package:flutter_app/screens/detailberita_screen.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class BeritaScreen extends StatefulWidget {
  const BeritaScreen({Key? key}) : super(key: key);

  @override
  _BeritaScreenState createState() => _BeritaScreenState();
}

class _BeritaScreenState extends State<BeritaScreen> {
  bool? loading;
  List<Articles>? responseBerita = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataBerita();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Berita"),
      ),
      body: ListView.builder(
          itemCount: responseBerita!.length,
          itemBuilder: (context, index) {
            Articles? articles = responseBerita?[index];
            // print("tes" + articles!.title!);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailBeritaScreen(
                                    articles: articles,
                                  )));
                    },
                    child: Card(
                      elevation: 7,
                      shadowColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.blue[200],
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              articles?.urlToImage ??
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png",
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              articles?.title ?? "-",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Cocola",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  articles?.author ?? "-",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  articles?.publishedAt?.substring(0, 10) ??
                                      "-",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      // tampilan horizontal
                      //  Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Flexible(
                      //       child: Text(
                      //         articles?.title ?? "-",
                      //         style: TextStyle(
                      //             color: Colors.white,
                      //             fontSize: 10,
                      //             fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //     CircleAvatar(
                      //       radius: 40,
                      //       backgroundImage: NetworkImage(
                      //         articles?.urlToImage ??
                      //             "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png",
                      //         // width: 50,
                      //         // height: 50,
                      //         // fit: BoxFit.fill,
                      //       ),
                      //     )
                      //   ],
                      // ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.black,
                  // )
                ],
              ),
            );
          }),
    );
  }

  getDataBerita() async {
    loading = true;
    var res = await http.get(Uri.parse(Api.BASE_URL));
    if (res.statusCode == 200) {
      Toast.show("Berhasil menampilkan data", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      var data = json.decode(res.body);
      var berita = data["articles"] as List;
      setState(() {
        loading = false;
        responseBerita =
            berita.map<Articles>((d) => Articles.fromJson(d)).toList();
        // print("data: " + responseBerita.toString());
      });
    } else {
      Toast.show("Gagal menampilkan data", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      loading = false;
    }
    return responseBerita;
  }
}

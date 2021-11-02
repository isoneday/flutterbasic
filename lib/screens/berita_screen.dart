import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/model_berita.dart';
import 'package:flutter_app/network/api.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class BeritaScreen extends StatefulWidget {
  const BeritaScreen({Key? key}) : super(key: key);

  @override
  _BeritaScreenState createState() => _BeritaScreenState();
}

class _BeritaScreenState extends State<BeritaScreen> {
  bool? loading;
  List<Articles>? responseBerita;
  Articles? articles;
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
            articles = responseBerita?[index];
            // print("tes" + articles!.title!);
            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => DetailWisataScreen(
                //               detailWisata: wisata,
                //             )));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 7,
                      shadowColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.blue[200],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              articles?.title ?? "-",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                articles?.urlToImage ??
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png",
                                // width: 50,
                                // height: 50,
                                // fit: BoxFit.fill,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Divider(
                    //   color: Colors.black,
                    // )
                  ],
                ),
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
            berita.map<Articles>((d) => Articles.fromJson(data)).toList();
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

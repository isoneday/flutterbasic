import 'package:flutter/material.dart';
import 'package:flutter_app/model/model_wisata.dart';
import 'package:flutter_app/screens/webwisata_screen.dart';

class DetailWisataScreen extends StatelessWidget {
  ModelWisata? detailWisata;
  DetailWisataScreen({Key? key, this.detailWisata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail ${detailWisata?.nama ?? "-"}"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WebWisata(
                              wisata: detailWisata,
                            )));
              },
              icon: Icon(Icons.open_in_browser))
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            "gambar/" + detailWisata!.gambar!,
            width: double.infinity,
            height: 200,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            detailWisata?.nama ?? "-",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            detailWisata?.alamat ?? "-",
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

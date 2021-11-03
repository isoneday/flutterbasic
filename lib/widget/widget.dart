import 'package:flutter/material.dart';
import 'package:flutter_app/data/data_wisata.dart';
import 'package:flutter_app/model/model_wisata.dart';
import 'package:flutter_app/screens/detailwisata_screen.dart';

Widget listWisata() {
  return ListView.builder(
      itemCount: DataWisata.itemCount,
      itemBuilder: (context, index) {
        ModelWisata wisata = DataWisata.getItemWisata(index);
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailWisataScreen(
                          detailWisata: wisata,
                        )));
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
                          wisata.nama ?? "-",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            "gambar/" + wisata.gambar!,
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
      });
}

Widget gridWisata() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: DataWisata.itemCount,
        itemBuilder: (_, index) {
          ModelWisata wisata = DataWisata.getItemWisata(index);
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  _,
                  MaterialPageRoute(
                      builder: (context) => DetailWisataScreen(
                            detailWisata: wisata,
                          )));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 7,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.asset(
                      "gambar/" + wisata.gambar!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      wisata.nama ?? "-",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_app/data/data_wisata.dart';
import 'package:flutter_app/model/model_wisata.dart';
import 'package:flutter_app/screens/detailwisata_screen.dart';

class ListWisataScreen extends StatelessWidget {
  const ListWisataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: ListView.builder(
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
          }),
    );
  }
}

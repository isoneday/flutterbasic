import 'package:flutter/material.dart';
import 'package:flutter_app/data/data_wisata.dart';
import 'package:flutter_app/model/model_wisata.dart';
import 'package:flutter_app/screens/detailwisata_screen.dart';
import 'package:flutter_app/widget/widget.dart';

class ListWisataScreen extends StatelessWidget {
  const ListWisataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List"),
        ),
        body: listWisata());
  }
}

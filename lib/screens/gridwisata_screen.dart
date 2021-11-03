import 'package:flutter/material.dart';
import 'package:flutter_app/data/data_wisata.dart';
import 'package:flutter_app/model/model_wisata.dart';
import 'package:flutter_app/widget/widget.dart';

import 'detailwisata_screen.dart';

class GridWisataScreen extends StatelessWidget {
  const GridWisataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid"),
      ),
      body: gridWisata()
    );
  }
}

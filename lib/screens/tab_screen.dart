import 'package:flutter/material.dart';
import 'package:flutter_app/data/data_wisata.dart';
import 'package:flutter_app/model/model_wisata.dart';
import 'package:flutter_app/widget/widget.dart';

import 'detailwisata_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab"),
        backgroundColor: Colors.green,
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(
              text: "List",
            ),
            Tab(
              text: "Grid",
            ),
            Tab(
              text: "Icon",
            ),
          ],
          indicatorColor: Colors.red,
        ),
      ),
      body: TabBarView(controller: controller, children: [
        Center(
          child: listWisata(),
        ),
        Center(
          child: gridWisata(),
        ),
        Center(
          child: Icon(Icons.call),
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';

class ListMakananScreen extends StatelessWidget {
  const ListMakananScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: Text("list makanan"),
    );
  }
}

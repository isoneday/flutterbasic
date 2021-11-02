import 'package:flutter/material.dart';
import 'package:flutter_app/model/model_wisata.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebWisata extends StatelessWidget {
  ModelWisata? wisata;
  WebWisata({Key? key, this.wisata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: wisata?.web ?? "https://id.wikipedia.org/wiki/Kota_Banjarmasin",
      appBar: new AppBar(
        title: new Text(wisata?.nama ?? "-"),
      ),
    );
  }
}

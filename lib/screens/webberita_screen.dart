import 'package:flutter/material.dart';
import 'package:flutter_app/model/model_berita.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebBeritaScreen extends StatelessWidget {
  Articles? articles;
  WebBeritaScreen({Key? key, this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: articles?.url ?? "https://id.wikipedia.org/wiki/Kota_Banjarmasin",
      appBar: new AppBar(
        title: new Text(articles?.author ?? "-"),
      ),
    );
  }
}

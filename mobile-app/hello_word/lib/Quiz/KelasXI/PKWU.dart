import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hello_word/menu.dart';
import 'package:hello_word/modal/api.dart';

class PKWUxi extends StatefulWidget {
  @override
  _PKWUxiState createState() => _PKWUxiState();
}

class _PKWUxiState extends State<PKWUxi> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: BaseUrl.pkwu,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Menu()));
          },
        ),
        title: Text("Produk Kreatif dan Kewirausahaan"),
      ),
    );
  }
}

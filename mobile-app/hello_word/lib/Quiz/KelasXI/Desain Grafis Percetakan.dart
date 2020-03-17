import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:hello_word/menu.dart';
import 'package:hello_word/modal/api.dart';

class DGPercetakan extends StatefulWidget {
  @override
  _DGPercetakanState createState() => _DGPercetakanState();
}

class _DGPercetakanState extends State<DGPercetakan> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: BaseUrl.dgp,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Menu()));
          },
        ),
        title: Text("Desain Grafis Percetakan"),
      ),
    );
  }
}

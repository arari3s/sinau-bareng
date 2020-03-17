import 'package:flutter/material.dart';
import 'package:hello_word/modal/materiModal.dart';

class DetailMateri extends StatefulWidget {
  final MateriModal model;
  DetailMateri(this.model);

  @override
  _DetailMateriState createState() => _DetailMateriState();
}

class _DetailMateriState extends State<DetailMateri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView(
          children: <Widget>[
            Image.network(
              'http://192.168.43.131/wpu-login/assets/materi/' +
                  widget.model.namafile,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}

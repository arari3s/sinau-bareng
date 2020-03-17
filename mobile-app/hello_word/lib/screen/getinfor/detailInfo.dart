import 'package:flutter/material.dart';
import 'package:hello_word/modal/informasiModal.dart';

class DetailInformasi extends StatefulWidget {
  final InformasiModal model;
  DetailInformasi(this.model);

  @override
  _DetailInformasiState createState() => _DetailInformasiState();
}

class _DetailInformasiState extends State<DetailInformasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView(
          children: <Widget>[
            Image.network(
              'http://192.168.43.131/wpu-login/assets/informasi/' +
                  widget.model.namafile,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}

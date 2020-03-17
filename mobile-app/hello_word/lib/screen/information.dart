import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_word/modal/api.dart';
import 'package:hello_word/modal/informasiModal.dart';
import 'package:hello_word/screen/getinfor/detailInfo.dart';
import 'package:http/http.dart' as http;

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  var loading = false;
  final list = new List<InformasiModal>();
  final GlobalKey<RefreshIndicatorState> _refresh =
      GlobalKey<RefreshIndicatorState>();
  Future<void> _lihatData() async {
    list.clear();
    setState(() {
      loading = true;
    });
    final response = await http.get(BaseUrl.getInformasi);
    if (response.contentLength == 2) {
    } else {
      final data = jsonDecode(response.body);
      data.forEach((api) {
        final ab = InformasiModal(
          api['judul'],
          api['namafile'],
        );
        list.add(ab);
      });
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _lihatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information"),
      ),
      body: RefreshIndicator(
        onRefresh: _lihatData,
        key: _refresh,
        child: OrientationBuilder(
          builder: (context, orientation) {
            return loading
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                    itemCount: list.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          orientation == Orientation.portrait ? 2 : 4,
                    ),
                    itemBuilder: (context, i) {
                      final x = list[i];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailInformasi(x)));
                        },
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Icon(Icons.image,
                                    size: 60, color: Colors.blueAccent),
                              ),
                              Text(
                                x.judul,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}

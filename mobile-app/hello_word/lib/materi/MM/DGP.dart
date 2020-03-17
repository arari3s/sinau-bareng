import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_word/materi/MM/detailMateri/detailMateri.dart';
import 'package:hello_word/modal/api.dart';
import 'package:hello_word/modal/materiModal.dart';
import 'package:http/http.dart' as http;

class DGP extends StatefulWidget {
  @override
  _DGPState createState() => _DGPState();
}

class _DGPState extends State<DGP> {
  var loading = false;
  final list = new List<MateriModal>();
  final GlobalKey<RefreshIndicatorState> _refresh =
      GlobalKey<RefreshIndicatorState>();
  Future<void> _lihatData() async {
    list.clear();
    setState(() {
      loading = true;
    });
    final response = await http.get(BaseUrl.getMateri);
    if (response.contentLength == 2) {
    } else {
      final data = jsonDecode(response.body);
      data.forEach((api) {
        final ab = new MateriModal(
          api['judul'],
          api['namafile'],
          api['kelas'],
          api['jurusan'],
          api['isactive'],
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
        backgroundColor: Colors.deepPurple[700],
        title: Text('Desain Grafis Percetakan'),
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
                          orientation == Orientation.portrait ? 3 : 6,
                    ),
                    itemBuilder: (context, i) {
                      final x = list[i];
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailMateri(x)));
                        },
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Icon(
                                  Icons.description,
                                  size: 60,
                                  color: Colors.blueAccent,
                                ),
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

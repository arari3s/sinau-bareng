import 'package:flutter/material.dart';

class AKD extends StatefulWidget {
  @override
  _AKDState createState() => _AKDState();
}

class _AKDState extends State<AKD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[900],
        title: Text('Akuntansi Dasar'),
      ),
    );
  }
}

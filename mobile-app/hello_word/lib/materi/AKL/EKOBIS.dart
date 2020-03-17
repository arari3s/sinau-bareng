import 'package:flutter/material.dart';

class EKOBIS extends StatefulWidget {
  @override
  _EKOBISState createState() => _EKOBISState();
}

class _EKOBISState extends State<EKOBIS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text('Ekonomi Bisnis'),
      ),
    );
  }
}

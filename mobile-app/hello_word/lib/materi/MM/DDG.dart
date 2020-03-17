import 'package:flutter/material.dart';

class DDG extends StatefulWidget {
  @override
  _DDGState createState() => _DDGState();
}

class _DDGState extends State<DDG> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen[900],
        title: Text('Dasar Desain Grafis'),
      ),
    );
  }
}

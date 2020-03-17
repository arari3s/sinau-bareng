import 'package:flutter/material.dart';

class DMI extends StatefulWidget {
  @override
  _DMIState createState() => _DMIState();
}

class _DMIState extends State<DMI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        title: Text('Desain Media Interaktif'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SISKOM extends StatefulWidget {
  @override
  _SISKOMState createState() => _SISKOMState();
}

class _SISKOMState extends State<SISKOM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[700],
        title: Text('Sistem Komputer'),
      ),
    );
  }
}

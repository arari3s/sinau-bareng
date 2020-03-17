import 'package:flutter/material.dart';

class TAV extends StatefulWidget {
  @override
  _TAVState createState() => _TAVState();
}

class _TAVState extends State<TAV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text('Teknik Pengolahan Audio dan Video'),
      ),
    );
  }
}

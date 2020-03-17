import 'package:flutter/material.dart';

class IPA extends StatefulWidget {
  @override
  _IPAState createState() => _IPAState();
}

class _IPAState extends State<IPA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        title: Text('IPA'),
      ),
    );
  }
}

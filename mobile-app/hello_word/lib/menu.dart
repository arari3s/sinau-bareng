import 'package:flutter/material.dart';
import 'package:hello_word/screen/home.dart';
import 'package:hello_word/screen/information.dart';
import 'package:hello_word/screen/quiz.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            HomeApps(),
            Information(),
            Quiz(),
          ],
        ),
        bottomNavigationBar: TabBar(
          labelColor: Colors.blue[900],
          unselectedLabelColor: Colors.grey,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(style: BorderStyle.none)),
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
              // text: "Home",
            ),
            Tab(
              icon: Icon(Icons.notifications),
              // text: "Information",
            ),
            Tab(
              icon: Icon(Icons.book),
              // text: "Quiz",
            )
          ],
        ),
      ),
    );
  }
}

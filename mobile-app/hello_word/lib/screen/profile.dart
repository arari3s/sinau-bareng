import 'package:flutter/material.dart';
import 'package:hello_word/login.dart';
import 'package:hello_word/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  final VoidCallback signOut;
  Profile(this.signOut);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  String email = "", name = "";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString("email");
      name = preferences.getString("name");
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 130.0,
              ),
              Container(
                width: 150.0,
                height: 150.0,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      width: 130.0,
                      height: 130.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue,
                            width: 5.0,
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/default.jpg'),
                            fit: BoxFit.cover,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "$name",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "$email",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 60, left: 60),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton.icon(
                          icon: Icon(
                            Icons.home,
                            color: Colors.blue,
                          ),
                          label: Text(
                            'HOME',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Menu()));
                          },
                        ),
                        FlatButton.icon(
                          icon: Icon(
                            Icons.input,
                            color: Colors.red,
                          ),
                          label: Text(
                            'SignOut',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          onPressed: () {
                            signOut();
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                "© 2019 Sinau Bareng",
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

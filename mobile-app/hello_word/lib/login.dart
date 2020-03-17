import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_word/menu.dart';
import 'package:hello_word/modal/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String username, password;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    final response = await http
        .post(BaseUrl.login, body: {"email": username, "password": password});
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    String emailAPI = data['email'];
    String nameAPI = data['name'];
    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value, emailAPI, nameAPI);
      });
      print(pesan);
    } else {
      print(pesan);
    }
  }

  savePref(int value, String email, String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("email", email);
      preferences.setString("name", name);
      preferences.commit();
    });
  }

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return new Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomPadding: true,
          body: Form(
            key: _key,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Image.asset(
                        "assets/image_01.png",
                        width: 200.0,
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Image.asset("assets/image_02.png")
                  ],
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 0.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 100.0,
                        ),
                        Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/logo.png",
                              width: 240.0,
                              height: 105.0,
                            ),
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 285.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.0, 15.0),
                                    blurRadius: 15.0),
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.0, -10.0),
                                    blurRadius: 10.0),
                              ]),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Login",
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontFamily: "Poppins-Bold",
                                        letterSpacing: .6)),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text("Email",
                                    style: TextStyle(
                                      fontFamily: "Poppins-Medium",
                                      fontSize: 17.0,
                                    )),
                                TextFormField(
                                  validator: (e) {
                                    if (e.isEmpty) {
                                      return "Please insert email";
                                    }
                                  },
                                  onSaved: (e) => username = e,
                                  decoration: InputDecoration(
                                      hintText: "email",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 12.0)),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text("Password",
                                    style: TextStyle(
                                      fontFamily: "Poppins-Medium",
                                      fontSize: 17.0,
                                    )),
                                TextFormField(
                                  obscureText: _secureText,
                                  onSaved: (e) => password = e,
                                  decoration: InputDecoration(
                                      hintText: "password",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 12.0),
                                      suffixIcon: IconButton(
                                        onPressed: showHide,
                                        icon: Icon(_secureText
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                      )),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontFamily: "Poppins-Medium",
                                          fontSize: 17.0),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 12.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                          child: Container(
                            width: 310.0,
                            height: 55.0,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xff17ead9),
                                  Color(0xff6078ea),
                                ]),
                                borderRadius: BorderRadius.circular(6.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xff6078ea).withOpacity(.3),
                                      offset: Offset(0.0, 8.0),
                                      blurRadius: 8.0)
                                ]),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  check();
                                },
                                child: Center(
                                  child: Text("Sign In",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Poppins-Bold",
                                          fontSize: 18,
                                          letterSpacing: 1.0)),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
        break;
      case LoginStatus.signIn:
        return Menu();
        break;
    }
  }
}

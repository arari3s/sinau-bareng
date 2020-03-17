import 'package:flutter/material.dart';
import 'package:hello_word/jurusan/Akuntansi.dart';
import 'package:hello_word/jurusan/Multimedia.dart';
import 'package:hello_word/jurusan/Pemasaran.dart';
import 'package:hello_word/jurusan/Perkantoran.dart';
import 'package:hello_word/screen/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeApps extends StatefulWidget {
  final VoidCallback signOut;

  const HomeApps({Key key, this.signOut}) : super(key: key);

  @override
  _HomeAppsState createState() => _HomeAppsState();
}

class _HomeAppsState extends State<HomeApps> {
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
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 430,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/background.jpeg'),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.2),
                    ]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 35,
                      right: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.white30,
                              child: IconButton(
                                icon: Icon(Icons.perm_identity,
                                    color: Colors.white),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profile()));
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Hai, $name",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Jurusan",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text("All")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Multimedia()));
                            },
                            child: Container(
                              width: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/multimedia.jpg'),
                                      fit: BoxFit.cover)),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.0),
                                      ]),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Multimedia',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Akuntansi()));
                            },
                            child: Container(
                              width: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: AssetImage('assets/akuntansi.jpg'),
                                      fit: BoxFit.cover)),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.0),
                                      ]),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Akuntansi',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Perkantoran()));
                            },
                            child: Container(
                              width: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/perkantoran.jpg'),
                                      fit: BoxFit.cover)),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.0),
                                      ]),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Perkantoran',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Pemasaran()));
                            },
                            child: Container(
                              width: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image: AssetImage('assets/pemasaran.jpg'),
                                      fit: BoxFit.cover)),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomRight,
                                      colors: [
                                        Colors.black.withOpacity(.8),
                                        Colors.black.withOpacity(.0),
                                      ]),
                                ),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Pemasaran',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // halaman kedua
                    // SizedBox(
                    //   height: 30,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: <Widget>[
                    //     Text(
                    //       "Information",
                    //       style: TextStyle(
                    //           color: Colors.black,
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.bold),
                    //     ),
                    //     Text("All")
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Container(
                    //   height: 150,
                    //   child: ListView(
                    //     scrollDirection: Axis.horizontal,
                    //     children: <Widget>[
                    //       InkWell(
                    //         onTap: () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => Pemasaran()));
                    //         },
                    //         child: Container(
                    //           width: 250,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(10.0),
                    //               image: DecorationImage(
                    //                   image: AssetImage('assets/pemasaran.jpg'),
                    //                   fit: BoxFit.cover)),
                    //           child: Container(
                    //             padding: EdgeInsets.all(10),
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(10),
                    //               gradient: LinearGradient(
                    //                   begin: Alignment.bottomRight,
                    //                   colors: [
                    //                     Colors.black.withOpacity(.8),
                    //                     Colors.black.withOpacity(.0),
                    //                   ]),
                    //             ),
                    //             child: Align(
                    //               alignment: Alignment.bottomLeft,
                    //               child: Text(
                    //                 'Informasi',
                    //                 style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontSize: 16,
                    //                     fontWeight: FontWeight.bold),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 20,
                    //       ),
                    //       InkWell(
                    //         onTap: () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => Pemasaran()));
                    //         },
                    //         child: Container(
                    //           width: 250,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(10.0),
                    //               image: DecorationImage(
                    //                   image:
                    //                       AssetImage('assets/perkantoran.jpg'),
                    //                   fit: BoxFit.cover)),
                    //           child: Container(
                    //             padding: EdgeInsets.all(10),
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(10),
                    //               gradient: LinearGradient(
                    //                   begin: Alignment.bottomRight,
                    //                   colors: [
                    //                     Colors.black.withOpacity(.8),
                    //                     Colors.black.withOpacity(.0),
                    //                   ]),
                    //             ),
                    //             child: Align(
                    //               alignment: Alignment.bottomLeft,
                    //               child: Text(
                    //                 'Informasi',
                    //                 style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontSize: 16,
                    //                     fontWeight: FontWeight.bold),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(
                    //         width: 20,
                    //       ),
                    //       InkWell(
                    //         onTap: () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => Pemasaran()));
                    //         },
                    //         child: Container(
                    //           width: 250,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(10.0),
                    //               image: DecorationImage(
                    //                   image: AssetImage('assets/akuntansi.jpg'),
                    //                   fit: BoxFit.cover)),
                    //           child: Container(
                    //             padding: EdgeInsets.all(10),
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(10),
                    //               gradient: LinearGradient(
                    //                   begin: Alignment.bottomRight,
                    //                   colors: [
                    //                     Colors.black.withOpacity(.8),
                    //                     Colors.black.withOpacity(.0),
                    //                   ]),
                    //             ),
                    //             child: Align(
                    //               alignment: Alignment.bottomLeft,
                    //               child: Text(
                    //                 'Informasi',
                    //                 style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontSize: 16,
                    //                     fontWeight: FontWeight.bold),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
                    // akhir halaman kedua
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

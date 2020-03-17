import 'package:flutter/material.dart';
import 'package:hello_word/Quiz/KelasXI/Desain%20Grafis%20Percetakan.dart';
import 'package:hello_word/Quiz/KelasXI/PKWU.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Material(
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/quiz.jpg'),
                fit: BoxFit.cover,
              )),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(.7),
                  Colors.black.withOpacity(.4),
                ])),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[],
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Text(
                      'QUIZ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins-Medium"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Mata Pelajaran",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "View more",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.arrow_forward_ios,
                            size: 11, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DGPercetakan()));
                    },
                    child: Container(
                      child: ListTile(
                        leading: Icon(
                          Icons.description,
                          color: Colors.blueAccent,
                        ),
                        title: Text(
                          "Desain Grafis Percetakan",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 2.0,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: ListTile(
                      leading: Icon(
                        Icons.description,
                        color: Colors.blueAccent,
                      ),
                      title: Text(
                        "Teknik Animasi 2D dan 3D",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 2.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PKWUxi()));
                  },
                  child: Container(
                    child: ListTile(
                      leading: Icon(
                        Icons.description,
                        color: Colors.blueAccent,
                      ),
                      title: Text(
                        "Produk Kreatif dan Kewirausahaan",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 2.0,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:urlrestapi/post_result.dart';
import 'package:urlrestapi/get_result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult = null;
  User user = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("DEMO API Dendy Refly"),
          backgroundColor: Colors.cyan,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                (user != null)? user.id + " | " + user.name  : "Tidak Ada Data",
                style: TextStyle(fontSize: 30, fontFamily: "Platinumsign"
                ),
              ),
              RaisedButton(
                onPressed:(){
                  User.connectToAPI("6").then((value){
                    setState(() {
                      user = value;
                    });
                  }).catchError((err){
                    setState((){
                      user = User.createUser({
                        "id": "Gagal",
                        "first_name": "Fetch",
                        "last_name": "Data"
                      });
                    });
                  });
                },
                child: Text("GET API"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui_helper/util.dart';

void main() {
  runApp(clientApp());
}

class clientApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter app",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: firstScreen(),
    );
  }
}

class firstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Client app bar",
        style: TextStyle(fontSize: 15),
      )),
      body: Column(
        children: [
          Text(" text 1", style: TextStyle(fontSize: 25)),
          Text(" text 2", style: TextStyle(fontSize: 25)),
          Text(" text 3", style: TextStyle(fontSize: 25)),
          Text(" text 4", style: myText21(textColor: Colors.green)),
        ],
      ),
    );
  }
}

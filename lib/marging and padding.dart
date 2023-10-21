import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "myAPP ",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: firstScreen(),
    );
  }
}

class firstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App bar")),
      body: Container(
        margin: EdgeInsets.all(8.0),
        color: Colors.cyan,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "hello world",
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}

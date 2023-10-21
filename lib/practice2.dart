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
      body: Center(
        child: Container(
          width: 100,
          height: 200,
          color: Colors.blue,
          child: Center(child: Text("This is cointainer.")),
        ),
      ),
    );
  }
}

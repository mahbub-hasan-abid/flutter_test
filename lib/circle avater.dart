import 'package:flutter/material.dart';

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
      appBar: AppBar(title: Text("Client app bar")),
      body: CircleAvatar(
        backgroundImage: AssetImage('assets/images/boy.jpg'),
        backgroundColor: Color.fromARGB(255, 10, 226, 28),
        radius: 30,
      ),
    );
  }
}

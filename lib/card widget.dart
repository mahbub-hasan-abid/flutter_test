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
      appBar: AppBar(
          title: Text(
        "Client app bar",
        style: TextStyle(fontSize: 15),
      )),
      body: Center(
        child: Card(
            shadowColor: Colors.red,
            shape: LinearBorder.top(),
            elevation: 20,
            color: Color.fromARGB(255, 30, 196, 99),
            child: Text(
              "card widget",
              style: TextStyle(
                  fontSize: 30, color: const Color.fromARGB(255, 219, 16, 16)),
            )),
      ),
    );
  }
}

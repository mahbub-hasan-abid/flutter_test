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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue.shade50,
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 37, 139, 114),
                //border: Border.all(color: Colors.black, width: 8),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 25, spreadRadius: 20, color: Colors.blue),
                ],
                shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}

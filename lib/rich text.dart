import 'package:flutter/material.dart';

void main() {
  runApp(richtext());
}

class richtext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "rich text",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: first_screen_rich_text(),
    );
  }
}

class first_screen_rich_text extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App of rich text"),
      ),
      body: RichText(
          text: const TextSpan(
              style: TextStyle(color: Colors.grey, fontSize: 30),
              children: [
            TextSpan(text: "hello"),
            TextSpan(
                text: " World !",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue)),
            TextSpan(text: " Welcome to "),
            TextSpan(
                text: "FLUTTER",
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 40,
                    fontWeight: FontWeight.bold))
          ])),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(callbackfuntion());
}

class callbackfuntion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "my foot",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: callbackscreen(),
    );
  }
}

callback22() {
  print("clicked!!!!!!!!!!!!!!!!!");
}

class callbackscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("callback bar")),
      body: ElevatedButton(
        child: Text("click me!"),
        onPressed:
            callback22, /*() {
         // print("clicked!!!!!!!");
        },*/
      ),
    );
  }
}

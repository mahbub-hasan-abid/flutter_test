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
//ddddddd
callback22() {
  print("clicked!!!!!!!!!!!!!!!!!");
}

class callbackscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("callback bar")),
      body: const ElevatedButton(onPressed: callback22, child: Text("click me!")
          /*() {
         // print("clicked!!!!!!!");
        },*/
          ),
    );
  }
}

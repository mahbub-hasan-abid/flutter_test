import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material AApp Bar'),
      ),
      body: Container(
          child: FlareActor(
        'assets/animation/Day_Night.flr',
        alignment: Alignment.center,
        fit: BoxFit.scaleDown,
        animation: 'midnight',
      )),
    );
  }
}

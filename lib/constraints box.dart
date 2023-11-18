import 'package:flutter/material.dart';

void main() {
  return runApp(ConstraintsBox());
}

class ConstraintsBox extends StatelessWidget {
  const ConstraintsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'box',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: ConstrainedBoxScreen(),
    );
  }
}

class ConstrainedBoxScreen extends StatelessWidget {
  const ConstrainedBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Constrain box'),
      ),
      body: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 150),
          child: Text(
            'Hello world Hello world Hello world Hello world Hello world',
            style: TextStyle(fontSize: 40),
            overflow: TextOverflow.ellipsis,
          )),
    );
  }
}

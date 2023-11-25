import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SecondPageOfDataPass extends StatelessWidget {
  var name;

  SecondPageOfDataPass(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('secondpage'),
      ),
      body: Center(
        child: Container(
          width: 300,
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Welcome \n $name',
              style: TextStyle(
                  fontSize: 30,
                  color: const Color.fromARGB(255, 255, 255, 255)),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

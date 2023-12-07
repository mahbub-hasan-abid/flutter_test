import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: 100, // MediaQuery.of(context).size.width,
        height: 200, //MediaQuery.of(context).size.height,
        child: Container(
          color: const Color.fromARGB(255, 149, 158, 165),
        ),
      ),
    );
  }
}

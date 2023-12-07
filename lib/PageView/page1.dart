import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Positioned(
          top: 200,
          left: 2000,
          child: Text(
            'Page 1',
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
        ),
      ),
    );
  }
}

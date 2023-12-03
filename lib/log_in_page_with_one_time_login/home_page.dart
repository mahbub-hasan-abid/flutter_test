import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.home),
            Text(' Home page'),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
        ],
      ),
      body: Container(
        width: 500,
        height: 500,
        color: Colors.black,
      ),
    );
  }
}

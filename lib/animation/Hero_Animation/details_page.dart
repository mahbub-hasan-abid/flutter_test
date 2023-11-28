import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation Second Page'),
      ),
      body: Image.asset('assets/images/boy.jpg'),
    );
  }
}

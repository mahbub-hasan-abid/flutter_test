import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Continuous Animated Button',
      home: AnimatedButton(),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  Color _currentColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    // Start a timer to continuously change colors
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _currentColor = _getRandomColor();
      });
    });
  }

  Color _getRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Continuous Animated Button'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [_currentColor, Colors.blue],
            ),
          ),
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Animated Button',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

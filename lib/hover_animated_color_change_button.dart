import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Button with Hover',
      home: AnimatedButton(),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isHovered = false;
  Color _currentColor = Colors.blue;

  void _handleHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
      if (_isHovered) {
        _currentColor = _getRandomColor();
      } else {
        _currentColor = Colors.blue;
      }
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
        title: Text('Animated Button with Hover'),
      ),
      body: Center(
        child: MouseRegion(
          onEnter: (_) => _handleHover(true),
          onExit: (_) => _handleHover(false),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                begin:
                    _isHovered ? Alignment.centerLeft : Alignment.centerRight,
                end: _isHovered ? Alignment.centerRight : Alignment.centerLeft,
                colors: [_currentColor, Colors.blue],
              ),
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Hover Me',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

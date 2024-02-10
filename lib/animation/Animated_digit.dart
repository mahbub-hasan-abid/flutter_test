import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(AnimatedDigit());
}

class AnimatedDigit extends StatelessWidget {
  const AnimatedDigit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimatedDigitFirstPage(),
    );
  }
}

class AnimatedDigitFirstPage extends StatefulWidget {
  const AnimatedDigitFirstPage({super.key});

  @override
  State<AnimatedDigitFirstPage> createState() => _AnimatedDigitFirstPageState();
}

class _AnimatedDigitFirstPageState extends State<AnimatedDigitFirstPage> {
  var set = 'selected';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dropdownbox'),
      ),
      body: AnimatedDigitWidget(value: 9799),
    );
  }
}

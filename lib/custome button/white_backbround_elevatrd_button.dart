import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Button Example',
      home: AnimatedButton(),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Button Example'),
      ),
      body: Center(
          child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(6),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(155))),
              ),
              onPressed: () {},
              child: Icon(Icons.add))),
    );
  }
}
 
          // decoration: const BoxDecoration(boxShadow: [
          //   BoxShadow(
          //       offset: Offset(0, 5),
          //       color: Colors.white,
          //       spreadRadius: 5,
          //       blurRadius: 5)
        
import 'package:flutter/material.dart';

void main() {
  return runApp(PassData());
}

class PassData extends StatelessWidget {
  const PassData({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: PassDataFirstScreen() , 
    );
  }
}
st

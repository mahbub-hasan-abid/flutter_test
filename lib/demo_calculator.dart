import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'app bar',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Calculator Bar')),
      ),
      body: Column(
        children: [
          Container(
            width: 300,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 0, 141, 54)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 141, 45, 0)),
                    )),
              ),
            ),
          ),
          Container(
            height: 20,
            // color: Colors.amber,
          ),
          Container(
            width: 300,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21))),
            ),
          )
        ],
      ),
    );
  }
}

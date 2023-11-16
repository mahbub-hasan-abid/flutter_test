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

var x = TextEditingController();
var y = TextEditingController();

var result = '';

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
                controller: x,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
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
              controller: y,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21))),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    var no1 = int.parse(x.text.toString());
                    var no2 = int.parse(y.text.toString());
                    var sum = no1 + no2;
                    result = 'The sum of $no1 and $no2 is $sum';
                    setState(() {});
                  },
                  child: Text('Sum')),
              ElevatedButton(
                  onPressed: () {
                    var no1 = int.parse(x.text.toString());
                    var no2 = int.parse(y.text.toString());
                    var sum = no1 - no2;
                    result = 'The difference between $no1 and $no2 is $sum';
                    setState(() {});
                  },
                  child: Text('Sub')),
              ElevatedButton(
                  onPressed: () {
                    var no1 = int.parse(x.text.toString());
                    var no2 = int.parse(y.text.toString());
                    var sum = no1 * no2;
                    result = 'The product of $no1 and $no2 is $sum';
                    setState(() {});
                  },
                  child: Text('Mult')),
              ElevatedButton(
                  onPressed: () {
                    var no1 = int.parse(x.text.toString());
                    var no2 = int.parse(y.text.toString());
                    var sum = no1 / no2;
                    result =
                        'The  $no1 can be divided by $no2 , ${sum.toStringAsFixed(3)}  times';
                    setState(() {});
                  },
                  child: Text('Div')),
            ],
          ),
          Container(
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: Text(
                  result,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  return runApp(dateapp());
}

class dateapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "date app",
      theme: ThemeData(primarySwatch: Colors.brown),
      home: datepage(),
    );
  }
}

class datepage extends StatefulWidget {
  @override
  State<datepage> createState() => _datepageState();
}

//test
class _datepageState extends State<datepage> {
  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Date app",
          style: TextStyle(fontSize: 55),
        ),
      ),
      body: Column(
        children: [
          Text(
            "date will be shown here : ${DateFormat('jms').format(time)} ",
            style: TextStyle(fontSize: 25),
          ),
          ElevatedButton(
              onPressed: () {
                print("Clicked.");
                setState(() {});
              },
              child: Text("current time"))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

void main() {
  return runApp(dateapp());
}

class dateapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "date app 2",
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
    //  var time = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Date picker",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "select date",
            style: TextStyle(fontSize: 25),
          ),
          ElevatedButton(
              onPressed: () async {
                DateTime? datepic = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2025));
                if (datepic != null) {
                  print('date picked : ${datepic.day}');
                }
              },
              child: Text("show")),
          ElevatedButton(
              onPressed: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    initialEntryMode: TimePickerEntryMode.input);
                if (pickedTime != null)
                  print(
                      "time selected : ${pickedTime.hour}: ${pickedTime.minute}");
              },
              child: Text("pick time"))
        ],
      ),
    );
  }
}

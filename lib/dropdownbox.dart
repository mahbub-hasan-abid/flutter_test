import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(drp());
}

class drp extends StatelessWidget {
  const drp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: drpf(),
    );
  }
}

class drpf extends StatefulWidget {
  const drpf({super.key});

  @override
  State<drpf> createState() => _drpfState();
}

class _drpfState extends State<drpf> {
  var set = 'selected';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dropdownbox'),
      ),
      body: Center(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(set),
            DropdownButton(
              iconSize: 150,
              items: [
                DropdownMenuItem(value: 'one', child: Text('One')),
                DropdownMenuItem(value: 'two', child: Text('Two'))
              ],
              onChanged: (value) {
                setState(() {
                  set = value!;
                });
              },
            )
          ]),
        ),
      ),
    );
  }
}

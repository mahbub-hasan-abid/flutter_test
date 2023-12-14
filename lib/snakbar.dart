import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(snk());
}

class snk extends StatelessWidget {
  const snk({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: snkFirst(),
    );
  }
}

class snkFirst extends StatefulWidget {
  snkFirst({super.key});

  @override
  State<snkFirst> createState() => _snkFirstState();
}

class _snkFirstState extends State<snkFirst> {
  var xvalue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbar '),
      ),
      body: Column(
        children: [
          Builder(
            builder: (cnt) => ElevatedButton(
                onPressed: () {
                  var snkbr = SnackBar(
                    content: Text('snak bar'),
                    duration: Duration(seconds: 3),
                    backgroundColor: Color.fromARGB(221, 150, 38, 38),
                    action: SnackBarAction(
                      label: 'ok',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(cnt).showSnackBar(snkbr);
                },
                child: const Text('click')),
          ),
          Text(
            'data',
            style: TextStyle(fontSize: 10 + xvalue),
          ),
          Slider(
            max: 50,
            min: 0,
            value: xvalue,
            onChanged: (value) {
              xvalue = value;
              setState(() {
                print(xvalue);
              });
            },
          )
        ],
      ),
    );
  }
}

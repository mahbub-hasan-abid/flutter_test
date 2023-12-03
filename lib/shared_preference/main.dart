// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(SharedP());
}

class SharedP extends StatelessWidget {
  const SharedP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBar',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: SpFirstScreen(),
    );
  }
}

// ignore: must_be_immutable
class SpFirstScreen extends StatefulWidget {
  @override
  State<SpFirstScreen> createState() => _SpFirstScreenState();
}

class _SpFirstScreenState extends State<SpFirstScreen> {
  var cnt = 0;
  LoadCounter() async {
    var pref = await SharedPreferences.getInstance();

    setState(() {
      cnt = pref.getInt('counter') ?? 0;
    });
  }

  increment() async {
    var pref = await SharedPreferences.getInstance();
    setState(() {
      cnt++;
      pref.setInt('counter', cnt);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    LoadCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Bar'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Count value is = $cnt',
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
              onPressed: () {
                increment();
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}

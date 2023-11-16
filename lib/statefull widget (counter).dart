import 'package:flutter/material.dart';

void main() {
  runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'app bar',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: CounterAppScreen(),
    );
  }
}

class CounterAppScreen extends StatefulWidget {
  const CounterAppScreen({super.key});

  @override
  State<CounterAppScreen> createState() => _CounterAppScreenState();
}

class _CounterAppScreenState extends State<CounterAppScreen> {
  int cnt = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter app Bar')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  cnt++;
                  setState(() {});
                },
                child: const Text(
                  "Counter++ ",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                )),
            Text(
              "Counter =$cnt",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    cnt = 0;
                  });
                },
                child: const Text(
                  'make counter equal to zero !',
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}

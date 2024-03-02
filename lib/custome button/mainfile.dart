import 'package:flutter/material.dart';
import 'package:flutter_application_1/custome%20button/button.dart';

main() {
  runApp(cusButton());
}

class cusButton extends StatelessWidget {
  const cusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const cusButtonHome(),
    );
  }
}

class cusButtonHome extends StatelessWidget {
  const cusButtonHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Custom Button'),
                ),
                PrettyBorderButton(label: "Alom vai jinda he", onPressed: () {})
              ],
            ),
          ],
        ),
      ),
    );
  }
}

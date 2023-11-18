import 'package:flutter/material.dart';
import 'package:flutter_application_1/switching_from_one_page_to_another/switching_from_one_page_to_another_2.dart';

void main() {
  return runApp(SwitchPage());
}

class SwitchPage extends StatelessWidget {
  const SwitchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: FirstScreen(),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('second page'),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black,
            child: Center(
              child: Column(
                children: [
                  Text(
                    'PSTU',
                    style: TextStyle(fontSize: 46, color: Colors.white),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return FirstScreen();
                          },
                        ));
                      },
                      child: Text(
                        'Back ',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ))
                ],
              ),
            )));
  }
}

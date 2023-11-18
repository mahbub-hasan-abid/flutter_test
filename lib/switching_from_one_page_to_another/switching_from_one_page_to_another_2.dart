import 'package:flutter/material.dart';
import 'package:flutter_application_1/switching_from_one_page_to_another/main.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: 200,
            child: Center(
                child: Text(
              'Welcome ',
              style: TextStyle(fontSize: 30),
            )),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SecondPage();
                  },
                ));
              },
              child: Text('To'))
        ],
      ),
    );
  }
}

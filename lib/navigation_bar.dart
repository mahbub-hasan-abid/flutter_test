import 'package:flutter/material.dart';
import 'package:flutter_application_1/PageView/Page4.dart';
import 'package:flutter_application_1/PageView/page1.dart';
import 'package:flutter_application_1/PageView/page2.dart';
import 'package:flutter_application_1/PageView/page3.dart';

void main(List<String> args) {
  runApp(nv());
}

class nv extends StatelessWidget {
  const nv({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: nv_fp(),
    );
  }
}

var pages = [Page1(), Page2(), Page3(), Page4()];

class nv_fp extends StatefulWidget {
  const nv_fp({super.key});

  @override
  State<nv_fp> createState() => _nv_fpState();
}

class _nv_fpState extends State<nv_fp> {
  var currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        currentIndex: currentindex,
        onTap: (value) {
          setState(() {
            currentindex = value;
          });
        },
        backgroundColor: Colors.redAccent,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.redAccent,
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.redAccent,
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.redAccent,
              icon: Icon(Icons.radio),
              label: 'radio'),
          BottomNavigationBarItem(
              backgroundColor: Colors.redAccent,
              icon: Icon(Icons.search),
              label: 'search'),
        ],
      ),
      body: pages[currentindex],
    );
  }
}

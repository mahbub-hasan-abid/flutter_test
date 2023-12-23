import 'package:flutter/material.dart';
import 'package:flutter_application_1/PageView/page1.dart';
import 'package:flutter_application_1/PageView/page5.dart';

void main(List<String> args) {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var SelectedIndex = 0;
  var pages = [Page1(), Page5()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demoe  Home Page'),
      ),
      body: Row(
        children: [
          NavigationRail(
            labelType: NavigationRailLabelType.all,
            backgroundColor: Colors.black,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(
                  Icons.wifi,
                  color: Colors.white,
                ),
                label: Text(
                  'Wifi',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                selectedIcon: Icon(
                  Icons.wifi,
                  color: Colors.blue,
                ),
              ),
              NavigationRailDestination(
                  icon: Icon(Icons.wb_sunny),
                  label: Text('Sunyy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  selectedIcon: Icon(
                    Icons.wb_sunny,
                    color: Colors.blue,
                  )),
            ],
            onDestinationSelected: (value) {
              setState(() {
                SelectedIndex = value;
              });
            },
            selectedIndex: SelectedIndex,
          ),
          Expanded(
              child: Container(
            child: pages[SelectedIndex],
          ))
        ],
      ),
    );
  }
}

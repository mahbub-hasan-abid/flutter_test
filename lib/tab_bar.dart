import 'package:flutter/material.dart';
import 'package:flutter_application_1/PageView/page1.dart';
import 'package:flutter_application_1/PageView/page2.dart';

void main(List<String> args) {
  runApp(tapbr());
}

class tapbr extends StatelessWidget {
  const tapbr({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: tapbrFp(),
    );
  }
}

class tapbrFp extends StatefulWidget {
  @override
  State<tapbrFp> createState() => _tapbrFpState();
}

class _tapbrFpState extends State<tapbrFp> with SingleTickerProviderStateMixin {
  var tabcont;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcont = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Bar'),
        bottom: TabBar(
            controller: tabcont,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black,
                  width: 3,
                ),
              ),
            ),
            tabs: [
              Tab(
                text: 'Tab 1',
              ),
              Tab(
                text: 'Tab 2',
              ),
            ]),
//backgroundColor: const Color.fromARGB(255, 165, 29, 29),
      ),
      body: TabBarView(controller: tabcont, children: [Page1(), Page2()]),
    );
  }
}

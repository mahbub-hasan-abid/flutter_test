import 'package:flutter/material.dart';
import 'package:flutter_application_1/PageView/Page4.dart';
import 'package:flutter_application_1/PageView/page1.dart';
import 'package:flutter_application_1/PageView/page2.dart';
import 'package:flutter_application_1/PageView/page3.dart';

void main() {
  runApp(PageViewTest());
}

class PageViewTest extends StatelessWidget {
  PageViewTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: PageViewFirstPage(),
    );
  }
}

// ignore: must_be_immutable
class PageViewFirstPage extends StatelessWidget {
  var controllerP = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APPPPPPP BARRRRRRRR'),
      ),
      body: PageView(
        controller: controllerP,
        children: [Page1(), Page2(), Page3(), Page4()],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/PageView/page1.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() => runApp(const MMyApp());

class MMyApp extends StatelessWidget {
  const MMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        theme: ThemeData(primarySwatch: Colors.amber),
        home: ftname());
  }
}

class ftname extends StatelessWidget {
  const ftname({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 102, 100, 133),
        title: const Text('Material App Bar'),
      ),
      body: IntroductionScreen(
        globalBackgroundColor: Color.fromARGB(255, 252, 252, 252),
        pages: [
          PageViewModel(
              title: 'Welcome',
              body: 'This is the first page',
              image: Image.asset('assets/images/flutter2.png')),
          PageViewModel(
              title: 'Welcome',
              body: 'This is the second page',
              image: Image.asset('assets/images/flutter.png')),
          PageViewModel(
              title: 'Welcome',
              body: 'This is the third page',
              image: Image.asset('assets/images/boy.jpg')),
        ],
        onDone: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Page1()));
        },
        done: CircleAvatar(
          backgroundColor: Colors.black,
          child: Icon(
            Icons.done,
            size: 40,
            color: Colors.green,
          ),
        ),
        showNextButton: true,
        next: Card(
          margin: EdgeInsets.all(20),
          color: Color.fromARGB(255, 102, 100, 133),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
              child: Text(
            '  next-> ',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
        showDoneButton: true,
        showBackButton: false,
        back: Card(
          margin: EdgeInsets.all(20),
          color: Color.fromARGB(255, 102, 100, 133),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text('Previous'),
        ),
        showSkipButton: true,
        skip: Text('Skip'),
        dotsDecorator: DotsDecorator(
          color: Colors.red,
          activeColor: Colors.green,
          size: Size(10, 10),
          activeSize: Size(20, 20),
        ),
      ),
    );
  }
}

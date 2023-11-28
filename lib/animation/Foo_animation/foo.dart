import 'package:flutter/material.dart';

void main() {
  runApp(FooAnimation());
}

class FooAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FOO Animation',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: FooAnimationFirstPage(),
    );
  }
}

class FooAnimationFirstPage extends StatefulWidget {
  @override
  State<FooAnimationFirstPage> createState() => _FooAnimationFirstPageState();
}

class _FooAnimationFirstPageState extends State<FooAnimationFirstPage> {
  var wd = 200.0;

  var ht = 300.0;
  var ok = true;
  var clr = Colors.amber;
  var x = 4.0;
  var op = 1.0;
  var vis = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FOOO ANIMATION'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 3),
              width: wd,
              height: ht,
              curve: Curves.bounceInOut,
              decoration: BoxDecoration(
                  color: clr, borderRadius: BorderRadius.circular(x)),
            ),
            ElevatedButton(
                onPressed: () {
                  if (ok) {
                    wd = 300.0;
                    ht = 200.0;
                    ok = false;
                    clr = Colors.blue;
                    x = 90.0;
                  } else {
                    wd = 200.0;
                    ht = 300.0;
                    clr = Colors.amber;
                    ok = true;
                    x = 25.0;
                  }

                  setState(() {});
                },
                child: Text('Animated')),
            AnimatedOpacity(
              opacity: op,
              duration: const Duration(seconds: 2),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (vis) {
                    op = 0.0;
                    vis = false;
                  } else {
                    op = 1.0;
                    vis = true;
                  }
                  setState(() {});
                },
                child: Text("Tap to vanish!!"))
          ],
        ),
      ),
    );
  }
}

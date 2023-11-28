import 'package:flutter/material.dart';
import 'package:flutter_application_1/animation/Hero_Animation/details_page.dart';

void main() {
  runApp(HeroAnimation());
}

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hero Animation',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: HeroFirstPage(),
    );
  }
}

class HeroFirstPage extends StatelessWidget {
  const HeroFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation First Page'),
      ),
      body: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(),
              ));
        },
        child: Center(
          child: Hero(
              tag: 'Background',
              child: Image.asset(
                'assets/images/boy.jpg',
                width: 150,
                height: 100,
              )),
        ),
      ),
    );
  }
}

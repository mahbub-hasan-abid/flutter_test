import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlareActor('animation/Day_Night.flr'),
    );
  }
}

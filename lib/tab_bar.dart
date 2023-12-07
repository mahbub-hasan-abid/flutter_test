import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating:
                true, // Set to true if you want the app bar to be visible while scrolling
            pinned:
                true, // Set to true if you want the app bar to remain visible at the top
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SilverAppBar Example'),
            ),
          ),

          // Other SliverList, SliverGrid, or other slivers can be added below
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

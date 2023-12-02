import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter app",
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: firstScreen(),
    );
  }
}

var items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Ite m 5'];

class firstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App Bar"),
        ),
        body: ListView.separated(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text('$index'),
              title: Text(items[index]),
              subtitle: Text(items[index]),
              trailing: Icon(Icons.add),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.black,
              height: 20,
            );
          },
        ));
  }
}

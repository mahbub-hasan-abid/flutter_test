import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.amber), home: dataTable());
  }
}

class dataTable extends StatelessWidget {
  const dataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('data Table'),
        ),
        body: DataTable(columns: const [
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Age')),
          DataColumn(label: Text('Role'))
        ], rows: const [
          DataRow(cells: [
            DataCell(Text('Abid')),
            DataCell(Text('253')),
            DataCell(Text('CEO'))
          ]),
          DataRow(cells: [
            DataCell(Text('Abid')),
            DataCell(Text('23')),
            DataCell(Text('CEO'))
          ]),
        ]));
  }
}

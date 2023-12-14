import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(disM());
}

class disM extends StatelessWidget {
  const disM({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: disMf(),
    );
  }
}

class disMf extends StatefulWidget {
  disMf({super.key});

  @override
  State<disMf> createState() => _disMfState();
}

class _disMfState extends State<disMf> {
  var bValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      body: Column(
        children: [
          Dismissible(
              background: Container(
                  color: Colors.red, child: Icon(Icons.delete_forever)),
              key: Key('keyVal'),
              child: ListTile(
                tileColor: (Colors.green),
                leading: Text('his his'),
                title: Text('man with band'),
                subtitle: Text('kuakata tour'),
                trailing: Icon(Icons.man),
              )),
          Row(
            children: [
              Checkbox(
                value: bValue,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    bValue = value!;
                  });
                },
              ),
              Text(bValue ? 'Checked' : 'unchecked'),
            ],
          ),
          Switch(
            focusColor: (Colors.greenAccent),
            value: bValue,
            onChanged: (value) {
              setState(() {
                bValue = value;
              });
            },
          ),
          ExpansionTile(
            leading: Text('his his'),
            title: Text('man with band'),
            subtitle: Text('kuakata tour'),
            trailing: Icon(Icons.man),
            children: [
              Container(
                height: 200,
                color: Colors.yellow,
              )
            ],
          )
        ],
      ),
    );
  }
}

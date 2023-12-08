import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const btmSheet());
}

class btmSheet extends StatelessWidget {
  const btmSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const btmFirst(),
    );
  }
}

class btmFirst extends StatelessWidget {
  const btmFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 300,
                    child: const SingleChildScrollView(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Text('One'),
                            subtitle: Text('This is one'),
                            trailing: Icon(Icons.access_alarms_outlined),
                          ),
                          ListTile(
                            leading: Text('One'),
                            subtitle: Text('This is one'),
                            trailing: Icon(Icons.access_alarms_outlined),
                          ),
                          ListTile(
                            focusColor: Colors.blue,
                            leading: Text('One'),
                            subtitle: Text('This is one'),
                            trailing: Icon(Icons.access_alarms_outlined),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: const Text('datas')),
      ),
    );
  }
}

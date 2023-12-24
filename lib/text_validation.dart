import 'package:flutter/material.dart';
import 'package:flutter_application_1/PageView/page1.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: home(),
    );
  }
}

class home extends StatelessWidget {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final c_pass = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _fromKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Name', border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: _pass,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Password', border: OutlineInputBorder()),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: c_pass,
                    validator: (value) {
                      if (value != _pass.text) {
                        return 'Password did not match';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder()),
                    obscureText: true,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('pressed');
                    if (_fromKey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context1) => Page1()));
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            )),
      ),
    );
  }
}

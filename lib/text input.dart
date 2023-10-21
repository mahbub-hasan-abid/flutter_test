import 'package:flutter/material.dart';

void main() {
  runApp(clientApp());
}

class clientApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter app",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: firstScreen(),
    );
  }
}

var emailText = TextEditingController();
var passText = TextEditingController();

class firstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Client app bar",
        style: TextStyle(fontSize: 15),
      )),
      body: Center(
          child: Container(
              width: 300,
              child: Column(
                children: [
                  Card(
                    elevation: 10,
                    child: TextField(
                      controller: emailText,
                      decoration: InputDecoration(
                          hintText: "Enter email ",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 255, 38, 0),
                                width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 5),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                  // color: Color.fromARGB(255, 57, 218, 17)
                                  )),
                          suffixText: "alrady exist",
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.remove_red_eye))),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 20,
                  ),
                  TextField(
                    controller: passText,
                    obscureText: true,
                    obscuringCharacter: '1',
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide:
                              BorderSide(color: Colors.orange, width: 6)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(color: Colors.orange)),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        String uEmail = emailText.text;
                        String uPass = passText.text;
                        print("Email : $uEmail ,pass: $uPass");
                      },
                      child: Text("Log in"))
                ],
              ))),
    );
  }
}

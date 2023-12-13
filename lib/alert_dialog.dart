import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(List<String> args) {
  runApp(alert());
}

class alert extends StatefulWidget {
  const alert({super.key});

  @override
  State<alert> createState() => _alertState();
}

class _alertState extends State<alert> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: alertFirst(),
    );
  }
}

class alertFirst extends StatelessWidget {
  const alertFirst({super.key});

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alert'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: ctx,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Are you sure?'),
                        content: Text('This is alert dialog'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('ok')),
                          ElevatedButton(
                              onPressed: () {
                                showToas();
                              },
                              child: Text('flutter toast'))
                        ],
                      );
                    },
                  );
                },
                child: Text('click here'),
              ),
              ElevatedButton(
                  onPressed: () {
                    showToas();
                  },
                  child: Text('Flutter toast')),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: ctx,
                      builder: (dcontext) {
                        int x = 0;
                        return Dialog(
                          child: Container(
                            color: Colors.green,
                            height: 400,
                            width: 200,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text('This is custome $x'),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                          'In Flutter, alert dialogs are used to display important information to the user and require them to take action. They can be used for various purposes, such as:Displaying warnings or errors: Alert the user about a potential problem or error.Asking for confirmation: Get the users confirmation before performing an action.Collecting information: Get input from the user through text fields.'),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            // Navigator.pop(ctx);
                                            setState() {
                                              x++;
                                              print(x);
                                            }
                                          },
                                          child: Text('Ok')),
                                    ],
                                  ),
                                ),
                                Positioned(
                                    left: 200,
                                    child: CircleAvatar(
                                        radius: 50,
                                        backgroundColor:
                                            Color.fromARGB(255, 211, 72, 72)))
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text('custome text')),
            ],
          ),
        ));
  }

  void showToas() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

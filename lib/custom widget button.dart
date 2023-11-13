import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui_helper/util.dart';
import 'package:flutter_application_1/widgets/rounded_button.dart';

void main() {
  return runApp(custom_widget());
}

class custom_widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "title",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: custom_widget_screen(),
    );
  }
}

class custom_widget_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("app bar"),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                width: 200,
                child: RoundedButton(
                  btnname: "  log In !",
                  icon: const Icon(Icons.lock),
                  textstyle: myText21(),
                  callBack: () {
                    print("log in!!!");
                  },
                ),
              ),
              Container(
                width: 200,
                child: const RoundedButton(
                    btnname: "  Play",
                    textstyle: TextStyle(fontSize: 23),
                    icon: Icon(Icons.play_arrow)),
              )
            ],
          ),
        ));
  }
}

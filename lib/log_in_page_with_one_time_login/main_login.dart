import 'package:flutter/material.dart';
import 'package:flutter_application_1/log_in_page_with_one_time_login/splash_screen_LG.dart';
//here is the page which has splash screen ,
//log in page (using shared preference  this will save the log in status),
//home page ,log out button

void main() {
  runApp(LogInPage());
}

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Shared preference',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: sp_login(),
    );
  }
}

class LogInFirstPage extends StatelessWidget {
  const LogInFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LogIn Page'),
      ),
    );
  }
}

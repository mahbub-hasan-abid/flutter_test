import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/log_in_page_with_one_time_login/LogIn.dart';
import 'package:flutter_application_1/log_in_page_with_one_time_login/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sp_login extends StatefulWidget {
  const sp_login({super.key});

  @override
  State<sp_login> createState() => _sp_loginState();
}

class _sp_loginState extends State<sp_login> {
  @override
  void initState() {
    super.initState();
    whereToGo();
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        child: Center(
          child: Text(
            'Splash Screen',
            style: TextStyle(
                fontSize: 45, fontWeight: FontWeight.w800, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Future<void> whereToGo() async {
    var logPref = await SharedPreferences.getInstance();

    var logVal = logPref.getBool('LOGIN');
    if (logVal == null || logVal == false) {
      Timer(Duration(seconds: 4), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LogInFirstPage(),
            ));
      });
    } else {
      Timer(Duration(seconds: 4), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      });
    }
  }
}

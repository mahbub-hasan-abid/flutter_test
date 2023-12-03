import 'package:flutter/material.dart';
import 'package:flutter_application_1/log_in_page_with_one_time_login/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class LogInFirstPage extends StatefulWidget {
  @override
  State<LogInFirstPage> createState() => _LogInFirstPageState();
}

class _LogInFirstPageState extends State<LogInFirstPage> {
  var pass = TextEditingController();

  var nm = TextEditingController();

  var update = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.width * .75,
                child: TextField(
                    controller: nm,
                    decoration: InputDecoration(
                        label: Text('Username'),
                        border: OutlineInputBorder()))),
            SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width * .75,
                child: TextField(
                    controller: pass,
                    decoration: InputDecoration(
                        label: Text('Password'),
                        border: OutlineInputBorder()))),
            ElevatedButton(
                onPressed: () async {
                  print(nm);
                  print(pass);
                  if (nm.text == 'admin' && pass.text == 'admin') {
                    var lPref = await SharedPreferences.getInstance();
                    lPref.setBool('LOGIN', true);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  } else {
                    update =
                        'invalid values.\n Please enter valid user name and password';
                    setState(() {});
                  }
                },
                child: Text('Log In')),
            Text(
              update,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}

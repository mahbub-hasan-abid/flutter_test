import 'package:flutter/material.dart';
import 'package:flutter_application_1/log_in_page_with_one_time_login/LogIn.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.home),
            Text(' Home page'),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 500,
            height: 500,
            color: Colors.black,
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.logout),
            label: Text('Log Out'),
            onPressed: () async {
              var pfer = await SharedPreferences.getInstance();
              pfer.setBool('LOGIN', false);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LogInFirstPage(),
                  ));
            },
          )
        ],
      ),
    );
  }
}

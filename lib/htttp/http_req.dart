import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data;
  Future fetchData() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=1'));
    setState(() {
      var decode = json.decode(response.body);
      data = decode['data'];
      print(data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchData();
    print('ok');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Flutter HTTP Request Example'),
      ),
      body: data == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(children: [
                  Card(
                    color: Colors.lightBlue,
                    child: ListTile(
                      // title: Text(data[index]['first_name']),
                      // subtitle: Text(data[index]['last_name']),
                      // trailing: Text((data[index]['id']) != null
                      //     ? '${(data[index]['id'])}'
                      //     : "empty"),
                      title: Text(
                        data[index]['first_name'],
                      ),
                      subtitle: Text(data[index]['last_name']),
                      leading:
                          CircleAvatar(child: Text('${data[index]['id']},')),
                      trailing: Text(data[index]['email']),
                    ),
                  ),
                ]);
              },
            ),
    );
  }
}

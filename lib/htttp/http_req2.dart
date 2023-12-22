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
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    setState(() {
      var decode = json.decode(response.body);
      data = decode;
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
                    color: Color.fromARGB(255, 213, 223, 226),
                    child: ExpansionTile(
                      leading:
                          CircleAvatar(child: Text('${data[index]['id']}')),
                      title: Text(data[index]['title']),
                      trailing: index % 2 == 0
                          ? Icon(Icons.emoji_people_outlined)
                          : Icon(Icons.ac_unit_outlined),
                      children: [
                        Divider(),
                        Container(
                          // color: Color.fromARGB(255, 253, 253, 253),
                          child: Text(data[index]['body']),
                        )
                      ],
                    ),
                  ),
                ]);
              },
            ),
    );
  }
}

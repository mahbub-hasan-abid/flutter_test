import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main(List<String> args) {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.amber), home: dataTable());
  }
}

// ignore: must_be_immutable
class dataTable extends StatelessWidget {
  dataTable({super.key});
  var urlG = 'https://www.google.com';
  var urlY = 'tel:01795107577';
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'smith@example.com',
  );
  final Uri smsLaunchUri = Uri(
    scheme: 'sms',
    path: '01795107577',
    queryParameters: <String, String>{
      'body': Uri.encodeComponent(
          'hy broooooooooooooooooooooooooooooooooooo!!!!!!!!!!!!!!!!!!!!'),
    },
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    await launchUrl(Uri.parse(urlG));
                  },
                  child: const ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Google'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse(urlY));
                  },
                  child: const ListTile(
                    leading: Icon(Icons.call),
                    title: Text('Call'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchUrl(emailLaunchUri);
                  },
                  child: const ListTile(
                    leading: Icon(Icons.mail),
                    title: Text('Mail'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchUrl(Uri.parse(
                        'mailto:mahbubhasanabid00@gmail.com?subject=Leave for a break &body= write what you want'));
                  },
                  child: const ListTile(
                    leading: Icon(Icons.mail_rounded),
                    title: Text('Mail2 2'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    launchUrl(smsLaunchUri);
                  },
                  child: const ListTile(
                    leading: Icon(Icons.sms),
                    title: Text('SMS'),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help'),
                ),
                const ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Exit'),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text('data Table'),
          ),
          body: DataTable(columns: const [
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Age')),
            DataColumn(label: Text('Role'))
          ], rows: const [
            DataRow(cells: [
              DataCell(Text('Abid')),
              DataCell(Text('253')),
              DataCell(Text('CEO'))
            ]),
            DataRow(cells: [
              DataCell(Text('Abid')),
              DataCell(Text('23')),
              DataCell(Text('CEO'))
            ]),
          ])),
    );
  }
}

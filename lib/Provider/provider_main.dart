import 'package:flutter/material.dart';
import 'package:flutter_application_1/Provider/provider_pv_data.dart';
import 'package:flutter_application_1/Provider/receive_data.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(create: (context) => data_pv(), child: pv()));
}

class pv extends StatelessWidget {
  const pv({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: pv_first(),
    );
  }
}

class pv_first extends StatefulWidget {
  const pv_first({super.key});

  @override
  State<pv_first> createState() => _pv_firstState();
}

class _pv_firstState extends State<pv_first> {
  @override
  Widget build(BuildContext context) {
    var providerData = Provider.of<data_pv>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('App bar 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              providerData.value.toString(),
              style: TextStyle(fontSize: 40),
            ),
            ElevatedButton(
                onPressed: () {
                  providerData.increment();
                },
                child: Text('Increment')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => recData(),
                      ));
                },
                child: Text('Move to next page')),
            ElevatedButton(
                onPressed: () {
                  providerData.value = 0;
                  providerData.updateScreen();
                },
                child: Text('Make it zero!!'))
          ],
        ),
      ),
    );
  }
}

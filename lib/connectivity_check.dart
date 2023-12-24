import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: conne(),
    );
  }
}

class conne extends StatefulWidget {
  @override
  State<conne> createState() => _conneState();
}

class _conneState extends State<conne> {
  StreamSubscription? subscription;
  @override
  void initState() {
    // TODO: implement initState
    subscription = Connectivity().onConnectivityChanged.listen((event) {
      checkConnection();
    });
    super.initState();
  }

  locationTrack() async {}

  Future checkConnection() async {
    var connectivityR = await (Connectivity().checkConnectivity());
    if (connectivityR == ConnectivityResult.mobile) {
      Fluttertoast.showToast(msg: 'connected to mobile');
    } else if (connectivityR == ConnectivityResult.wifi)
      Fluttertoast.showToast(msg: 'connected to wifi');
    else if (connectivityR == ConnectivityResult.ethernet)
      Fluttertoast.showToast(msg: 'connected to ethernet');
    else if (connectivityR == ConnectivityResult.none)
      Fluttertoast.showToast(msg: 'not connected');
  }

  checkBluetooth() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  checkConnection();
                },
                child: Text('Check connection')),
            ElevatedButton(
                onPressed: () => checkBluetooth(),
                child: Text('Check bluetooth status'))
          ],
        ),
      ),
    );
  }
}

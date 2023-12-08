import 'package:flutter/material.dart';
import 'package:flutter_application_1/Provider/provider_pv_data.dart';
import 'package:provider/provider.dart';

class recData extends StatelessWidget {
  const recData({super.key});

  @override
  Widget build(BuildContext context) {
    var providerDatas = Provider.of<data_pv>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
            child: Center(
              child: Text(
                providerDatas.value.toString(),
                style: TextStyle(fontSize: 40),
              ),
            )),
      ),
    );
  }
}

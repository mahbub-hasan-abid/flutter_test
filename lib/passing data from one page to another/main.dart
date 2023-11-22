import 'package:flutter/material.dart';
import 'package:flutter_application_1/passing%20data%20from%20one%20page%20to%20another/second_page.dart';

void main() {
  return runApp(PassData());
}

class PassData extends StatelessWidget {
  const PassData({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: PassDataFirstScreen(),
    );
  }
}

class PassDataFirstScreen extends StatefulWidget {
  PassDataFirstScreen({super.key});

  @override
  State<PassDataFirstScreen> createState() => _PassDataFirstScreenState();
}

class _PassDataFirstScreenState extends State<PassDataFirstScreen> {
  var NameController = TextEditingController();
  GlobalKey<FormState> formK = GlobalKey<FormState>();
  var result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your name:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200,
              // height: 40,
              child: Form(
                key: formK,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter name';
                    }
                    return null;
                  },
                  controller: NameController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (formK.currentState!.validate()) {
                    result = NameController.text;
                    setState(() {});
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPageOfDataPass(result),
                      ));
                },
                child: Text(
                  'Log in !',
                  style: TextStyle(fontSize: 16),
                )),
            // Text(result.toString().isEmpty ? 'your name' : result)
          ],
        ),
      ),
    );
  }
}

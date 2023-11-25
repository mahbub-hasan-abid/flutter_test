import 'package:flutter/material.dart';

void main() {
  runApp(BMI_App());
}

class BMI_App extends StatelessWidget {
  const BMI_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI APP',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: BmiFirstScreen(),
    );
  }
}

// ignore: must_be_immutable
class BmiFirstScreen extends StatefulWidget {
  @override
  State<BmiFirstScreen> createState() => _BmiFirstScreenState();
}

class _BmiFirstScreenState extends State<BmiFirstScreen> {
  var hft = TextEditingController();

  var wkg = TextEditingController();

  var inc = TextEditingController();

  var result = "";
  var bgColor = Colors.white;
  var msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI App ',
          ),
        ),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'BMI',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: wkg,
                      decoration: InputDecoration(
                          label: Text('Enter your weight (In kg)'),
                          prefixIcon: Icon(Icons.line_weight),
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: hft,
                      decoration: InputDecoration(
                          label: Text('Enter your height (In Feet)'),
                          prefixIcon: Icon(Icons.height),
                          border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: inc,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Enter your height (In Inch)'),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (inc.text != '' &&
                            wkg.text != '' &&
                            hft.text != '') {
                          var iwt = int.parse(wkg.text.toString());
                          var iinc = int.parse(inc.text.toString());
                          var ift = int.parse(hft.text.toString());
                          var tInch = (ift * 12) + iinc;
                          var tCm = tInch * 2.54;
                          var tM = tCm / 100;
                          var bmi = iwt / (tM * tM);
                          if (bmi > 25) {
                            msg = "You're overweight!!";
                            bgColor = Colors.orange;
                          } else if (bmi < 18) {
                            msg = "You're underweight!!";
                            bgColor = Colors.green;
                          } else {
                            msg = "You are hrealthy!!";
                            bgColor = Colors.green;
                          }
                          result =
                              '$msg \n Your BMI is ${bmi.toStringAsFixed(2)}';
                          setState(() {});
                        } else {
                          result = "Please fill all the requirments.";

                          setState(() {});
                        }
                      },
                      child: Text('Calculate!')),
                  Text(
                    result,
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

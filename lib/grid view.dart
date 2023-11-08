import 'package:flutter/material.dart';

void main() {
  runApp(my_app());
}

var arrColor = [
  Colors.orange,
  Color.fromARGB(255, 79, 20, 241),
  Color.fromARGB(255, 2, 253, 14),
  Colors.red,
  Colors.black,
  Colors.orange,
  Color.fromARGB(255, 79, 20, 241),
  Color.fromARGB(255, 2, 253, 14),
  Colors.red,
  Colors.black,
];

class my_app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ma_App",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: screenForGridview(),
    );
  }
}

class screenForGridview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("hello"),
        ),
        body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Container(
              color: arrColor[index],
            );
          },
          itemCount: arrColor.length,
        )

        /* GridView.builder(
        itemBuilder: (context, index) {
          return Container(
            color: arrColor[index],
          );
        },
        itemCount: arrColor.length,
      ),*/

        /* Column(
        children: [
          Container(
            height: 300,
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: arrColor[0]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: arrColor[1]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: arrColor[2]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: arrColor[3]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: arrColor[4]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: arrColor[5]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: arrColor[6]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: arrColor[7]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: arrColor[8]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: arrColor[9]),
                ),
                //Container(color: arrColor[10])
              ],
            ),
          ),
          Container(
            height: 20,
            color: Colors.amber,
          ),
          Container(
            height: 300,
            child: GridView.extent(
              maxCrossAxisExtent: 99,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              children: [
                Container(color: arrColor[0]),
                Container(color: arrColor[1]),
                Container(color: arrColor[2]),
                Container(color: arrColor[3]),
                Container(color: arrColor[4]),
                Container(color: arrColor[5]),
                Container(color: arrColor[6]),
                Container(color: arrColor[7]),
                Container(color: arrColor[8]),
                Container(color: arrColor[9]),
                //Container(color: arrColor[0]),
              ],
            ),
          )
        ],
      ),*/
        );
  }
}

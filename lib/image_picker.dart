import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main(List<String> args) {
  runApp(ImgPicker());
}

class ImgPicker extends StatelessWidget {
  const ImgPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: ImgPickerHome(),
    );
  }
}

// ignore: must_be_immutable
class ImgPickerHome extends StatefulWidget {
  ImgPickerHome({super.key});

  @override
  State<ImgPickerHome> createState() => _ImgPickerHomeState();
}

class _ImgPickerHomeState extends State<ImgPickerHome> {
  var img;

  CameraImage() async {
    // ignore: await_only_futures, unused_local_variable
    var imgpik = await ImagePicker().pickImage(source: ImageSource.camera);
    img = File(imgpik!.path);
    setState(() {});
  }

  GalleryImage() async {
    var imgGall = await ImagePicker().pickImage(source: ImageSource.gallery);
    img = File(imgGall!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick a pictures')),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.75,
            color: Colors.blue,
            child: img == null
                ? Center(child: Text('Select picture'))
                : Image.file(img),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  CameraImage();
                },
                icon: Icon(
                  Icons.camera_alt_outlined,
                  size: 35,
                ),
                label: Text('Pic from camera'),
              ),
              SizedBox(
                width: 30,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  GalleryImage();
                },
                icon: Icon(
                  Icons.photo,
                  size: 35,
                ),
                label: Text('Pic from gallery'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

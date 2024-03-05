import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Text(FirebaseAuth.instance.currentUser?.email ?? ' not set'),
          IconButton(
            onPressed: () {
              try {
                FirebaseAuth.instance.signOut();
              } catch (e) {
                print(e);
              }
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ageController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your age',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your email',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(emailController.text)
                      .set({
                    'name': nameController.text,
                    'age': ageController.text,
                    'email': emailController.text,
                  }).then((_) {
                    print("Data added successfully!");
                  }).catchError((error) {
                    print("Failed to add data: $error");
                  });
                  ;
                },
                child: const Text('Submit')),
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("users").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                final response = snapshot.data?.docs;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: response?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(response?[index]['name']),
                      subtitle: Text(response?[index]['age']),
                      trailing: Text(response?[index]['email']),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:gold_lenden/screens/customers/utils/text_field.dart';

class searchableDropdownCustomer extends StatefulWidget {
  searchableDropdownCustomer(
      {required this.customerIdController,
      required this.nameController,
      required this.title,
      required this.label});
  TextEditingController? customerIdController = TextEditingController();
  TextEditingController? nameController = TextEditingController();
  final title;
  final label;

  @override
  State<searchableDropdownCustomer> createState() =>
      _searchableDropdownCustomerState();
}

List<Map> customerList = [];

var isload;

Future<bool> fetchAllData() async {
  final rawDataRespons =
      FirebaseFirestore.instance.collection('customers').get();
  final rawDataSnapshot = await rawDataRespons;
  customerList.clear();
  print('List cleared...list length:  ${customerList.length.toString()}');
  for (var element in rawDataSnapshot.docs) {
    // i want to check if the data called english name is null?
    customerList.add(element.data());
  }
  print('customerList.length of raw data=${rawDataSnapshot.docs.length}');
  print('customerList.length=${customerList.length}');

  return true;
}

class _searchableDropdownCustomerState
    extends State<searchableDropdownCustomer> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    isload = fetchAllData();
  }

  TextEditingController ss = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: isload,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TypeAheadField(
                  controller: widget.nameController,
                  suggestionsCallback: (pattern) async {
                    return customerList
                        .where((element) => element['englishName']
                            .toLowerCase()
                            .toString()
                            .contains(pattern.toLowerCase()))
                        .toList()
                        .map((e) => e['englishName'].toString())
                        .toList();
                  },
                  builder: (context, controller, focusNode) {
                    return FormTextFiled(
                        title: widget.title,
                        lebel: widget.label,
                        controller: widget.nameController!,
                        focusNode: focusNode);
                  },
                  itemBuilder: (context, value) {
                    return ListTile(
                      title: Text(value),
                    );
                  },
                  hideOnEmpty: true,
                  onSelected: (value) {
                    final selectedCustomer = customerList.firstWhere(
                        (element) => element['englishName'] == value);
                    widget.nameController?.text =
                        selectedCustomer['englishName'] ?? '';
                    // print(selectedCustomer);

                    widget.customerIdController?.text =
                        selectedCustomer['customerID'] ?? '';
                    widget.nameController?.text =
                        selectedCustomer['englishName'] ?? '';
                  },
                ),
              ]);
        });
  }
}

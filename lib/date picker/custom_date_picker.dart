import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';

class DatePickerPage extends StatefulWidget {
  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime? _selectedDate;
  final Map<String, Set<String>> highlightedDates2 = {
    '2024-06-20': {'gold'},
    '2024-07-04': {'silver'},
    '2024-08-15': {'gold', 'silver'},
    '2024-08-16': {'silver'},
  };
  Map<String, Set<String>> _highlightedDates = {};
  Future<void> _showRoundedDatePicker() async {
    DateTime? newDateTime = await showRoundedDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
      borderRadius: 16,
      theme: ThemeData(
        primaryColor: Colors.green,
        hintColor: Colors.yellow,
        dialogBackgroundColor: Colors.white,
      ),
      builderDay: (dateTime, isCurrentDay, isSelected, defaultTextStyle) {
        if (isSelected) {
          return Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 223, 216, 206),
                border: Border.all(color: Colors.black),
                shape: BoxShape.circle),
            child: Center(
              child: Text(
                dateTime.day.toString(),
                style: defaultTextStyle,
              ),
            ),
          );
        }

        ///  String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
        String formattedDate =
            '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
        print('formattedDate------------------');
        print(formattedDate);
        //  Set<String>? highlightTypes = _highlightedDates[formattedDate];
        Set<String>? highlightTypes = highlightedDates2[formattedDate];
        print('highlightTypes------------------');
        print(highlightTypes);
        if (highlightTypes != null) {
          if (highlightTypes.contains('gold') &&
              highlightTypes.contains('silver')) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: SweepGradient(
                  colors: [
                    Colors.amber,
                    Colors.amber,
                    Colors.grey,
                    Colors.grey
                  ],
                  stops: [0.0, 0.5, 0.5, 1.0],
                ),
              ),
              child: Center(
                child: Text(
                  dateTime.day.toString(),
                  style: defaultTextStyle,
                ),
              ),
            );
          } else if (highlightTypes.contains('gold')) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber, width: 4),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  dateTime.day.toString(),
                  style: defaultTextStyle,
                ),
              ),
            );
          } else if (highlightTypes.contains('silver')) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 4),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  dateTime.day.toString(),
                  style: defaultTextStyle,
                ),
              ),
            );
          }
        }

        return Container(
          child: Center(
            child: Text(
              dateTime.day.toString(),
              style: defaultTextStyle,
            ),
          ),
        );
      },
    );

    if (newDateTime != null) {
      setState(() {
        _selectedDate = newDateTime;
      });
    }
  }

  Future<void> _fetchHighlightedDates() async {
    Map<String, Set<String>> highlightedDates = await getHighlightedDates();
    setState(() {
      _highlightedDates = highlightedDates;
      print('-----------------------------------------------------');
      print(highlightedDates);
      print(highlightedDates2);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchHighlightedDates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rounded Date Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _showRoundedDatePicker,
              child: Text('Show Rounded Date Picker'),
            ),
            if (_selectedDate != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Selected Date: ${_selectedDate!.toLocal()}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ElevatedButton(
                onPressed: () {
                  //have to send value to the  firebase
                  addOrUpdateHighlight(DateTime.now(), 'gold');
                  setState(() {});
                },
                child: Text('Add gold')),
            ElevatedButton(
                onPressed: () {
                  addOrUpdateHighlight(DateTime.now(), 'silver');
                  setState(() {});
                },
                child: Text('Add silver'))
          ],
        ),
      ),
    );
  }
}

Future<void> addOrUpdateHighlight(DateTime date, String highlight) async {
  String formattedDate =
      '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

  FirebaseFirestore db = FirebaseFirestore.instance;
  DocumentReference docRef =
      db.collection("highlighted_dates").doc(formattedDate);

  // Check if the document exists
  DocumentSnapshot docSnapshot = await docRef.get();

  if (docSnapshot.exists) {
    // Ensure the data is properly cast to Map<String, dynamic>
    Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
    Set<String> highlights = Set<String>.from(data['highlights'] ?? []);
    highlights.add(highlight);
    await docRef.set({'highlights': highlights.toList()});
  } else {
    // If it doesn't exist, create a new document
    await docRef.set({
      'highlights': [highlight]
    });
  }
}

Future<Map<String, Set<String>>> getHighlightedDates() async {
  FirebaseFirestore db = FirebaseFirestore.instance;
  QuerySnapshot querySnapshot = await db.collection("highlighted_dates").get();

  Map<String, Set<String>> highlightedDates = {};

  for (QueryDocumentSnapshot doc in querySnapshot.docs) {
    print("date from  getHighlightedDates------------------");
    String dateStr = doc.id; // e.g., "2024-7-4"
    List<String> highlightList =
        List<String>.from((doc.data() as Map<String, dynamic>)['highlights']);
    List<int> dateParts = dateStr.split('-').map((e) => int.parse(e)).toList();
    DateTime date = DateTime(dateParts[0], dateParts[1], dateParts[2]);

    print("date: $date");
    print(dateParts[0]);
    highlightedDates[
            '${dateParts[0]}-${dateParts[1].toString().padLeft(2, '0')}-${dateParts[2].toString().padLeft(2, '0')}'] =
        highlightList.toSet();
  }

  return highlightedDates;
}

import 'package:flutter/material.dart';
import 'package:postnotetute/google_sheets_api.dart';

class MyCheckBoxList extends StatefulWidget {
  const MyCheckBoxList({Key? key}) : super(key: key);

  @override
  _MyCheckBoxListState createState() => _MyCheckBoxListState();
}

class _MyCheckBoxListState extends State<MyCheckBoxList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: GoogleSheetsApi.currentNotes.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                color: GoogleSheetsApi.currentNotes[index][1] == 0
                    ? Colors.grey[200]
                    : Colors.grey[300],
                child: CheckboxListTile(
                  value: GoogleSheetsApi.currentNotes[index][1] == 0
                      ? false
                      : true,
                  onChanged: (newValue) {
                    GoogleSheetsApi.update(index, newValue == false ? 0 : 1);
                    setState(() {
                      GoogleSheetsApi.currentNotes[index][1] =
                          newValue == false ? 0 : 1;
                    });
                  },
                  title: Text(
                    GoogleSheetsApi.currentNotes[index][0],
                    style: TextStyle(
                        color: GoogleSheetsApi.currentNotes[index][1] == 0
                            ? Colors.grey[800]
                            : Colors.grey[500]),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

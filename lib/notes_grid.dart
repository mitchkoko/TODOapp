import 'package:flutter/material.dart';
import 'package:postnotetute/google_sheets_api.dart';
import 'package:postnotetute/textbox.dart';

class NotesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: GoogleSheetsApi.currentNotes.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (BuildContext context, int index) {
          return MyTextBox(text: GoogleSheetsApi.currentNotes[index][0]);
        });
  }
}

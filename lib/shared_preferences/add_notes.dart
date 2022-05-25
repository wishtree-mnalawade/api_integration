import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shared prefrences'
        ),
        centerTitle: true,
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(

            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ShowData extends StatefulWidget {
   ShowData({Key? key,this.frist='',this.next=''}) : super(key: key);
String frist="";
String next="";
  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('show data'),
        centerTitle: true,
      ),
      body:Center(
        child: Text("Title: ${widget.frist }\n\n body: ${widget.next}"),
      )
    );
  }
}

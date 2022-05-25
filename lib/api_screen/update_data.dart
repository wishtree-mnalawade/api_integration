
import 'package:flutter/material.dart';

import '../api/api_services.dart';

class UpdateData extends StatefulWidget {
  UpdateData({Key? key, this.title = '', this.body = ''}) : super(key: key);
  String title = " ";
  String body = " ";

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController updateTitleController = TextEditingController();
  final TextEditingController updateBodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    updateTitleController.text = widget.title;
    updateBodyController.text = widget.body;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Update data'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Title",
                      style: TextStyle(fontSize: 25),
                    ),
                    TextFormField(
                        autofocus: false,
                        controller: updateTitleController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "Title",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
                    const SizedBox(height: 25),
                    const Text(
                      "body",
                      style: TextStyle(fontSize: 25),
                    ),
                    TextFormField(
                        autofocus: false,
                        controller: updateBodyController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          hintText: "body",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
                    const SizedBox(height: 35),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.redAccent,
                      child: MaterialButton(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed: () async {
                            await ApiServices.putData(
                                id: "1",
                                title: updateTitleController.text,
                                body: updateBodyController.text);
                          },
                          child: const Text(
                            "submit",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:api_integration/api_screen/show_data_next_page.dart';
import 'package:flutter/material.dart';
import '../api/api_services.dart';

class PostData extends StatefulWidget {
  PostData({Key? key, this.title = "", this.body = ""}) : super(key: key);
  String title = "";
  String body = "";

  @override
  State<PostData> createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  late final String title;
  late final String body;

  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

//   Future PostData() async{
//     final updateUrl = Uri.parse("https://jsonplaceholder.typicode.com/posts/");
//     final response = await http.put(updateUrl,body:{
//       {
//         "userId": 1,
//         "id": 1,
//         "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//         "body": "suscipit recusandae consequuntur expedita et cum"
//       },
//     });
//
//
//
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Post data'),
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
                        controller: titleController,
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
                        controller: bodyController,
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
                            await ApiServices.postData(title: titleController.text,body: bodyController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ShowData(
                                frist:titleController.text,
                                next:bodyController.text,

                              )),
                            );
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

import 'package:api_integration/api_screen/post_data.dart';
import 'package:api_integration/api_screen/update_data.dart';
import 'package:flutter/material.dart';

import '../api/api_services.dart';

class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  var _postsJson = [];

  // void fetchData() async {
  //   final response = await get(
  //       Uri.parse("https://jsonplaceholder.typicode.com/posts"));
  //   final data = jsonDecode(response.body) as List;
  //   // print (data);
  //
  //   setState(() {
  //     _postsJson = data;
  //   });
  // }

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    ApiServices.fetchData().then((value) {
      setState(() {
        _postsJson = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostData()),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
      body: ListView.builder(
          itemCount: _postsJson.length,
          itemBuilder: (context, index) {
            final post = _postsJson[index];
            return Column(
              children: [
                Text("Title: ${post["title"]} \n\n body: ${post["body"]}\n"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UpdateData(
                                    title: post["title"],
                                    body: post["body"],
                                  )),
                        );
                      },
                      child: const Text('update data'),
                    ),
                    const SizedBox(width: 25),
                    MaterialButton(
                      color: Colors.blue,
                      onPressed: () async {
                        await ApiServices.deleteData(id: "1");
                      },
                      child: const Text('delete data'),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
              ],
            );
          }),
    );
  }
}

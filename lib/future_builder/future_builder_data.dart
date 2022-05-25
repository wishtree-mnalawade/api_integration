import 'package:flutter/material.dart';

import '../api/api_services.dart';
import '../api_screen/update_data.dart';

class FutureBuilderData extends StatefulWidget {
  const FutureBuilderData({Key? key}) : super(key: key);

  @override
  State<FutureBuilderData> createState() => _FutureBuilderDataState();
}

class _FutureBuilderDataState extends State<FutureBuilderData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ApiServices.GetfutureData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView.builder(

              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
               final post = snapshot.data?[index];
                return Column(
                  children: [
                    Text("Title: ${post?["title"]} \n\n body: ${post?["body"]}\n"),
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
                                    title: post?["title"],
                                    body: post?["body"],
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
              });
            },
  )
    );
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class ApiServices {
  /// Get request
  static Future<List> fetchData() async {
    final response =
        await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    final data = jsonDecode(response.body) as List;
    return data;
  }

  /// Get request using future buider
  static Future<List> GetfutureData() async {
    final response =
    await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    final data = jsonDecode(response.body) as List;
    return data;
  }

  /// post request [title]
  static Future postData({String title="",String body=""}) async {
    try {
      final response = await post(
          Uri.parse("https://jsonplaceholder.typicode.com/posts"),
          body: {"title": title, "body": body, "userId": "1"});
      print(response.statusCode);
      print(response.body);
          switch (response.statusCode) {
            case (200):
              // handles on success
            case (201):
              // handles on post success                  
            case (400):
              // show error message for status code 400
            case (500):
              // show error message for status code 500
            default:
              break;
          }


    } catch (e) {
      if (e is SocketException) {
        //treat SocketException
        print("Socket exception: ${e.toString()}");
      } else if (e is TimeoutException) {
        //treat TimeoutException
        print("Timeout exception: ${e.toString()}");
      } else {
        print("Unhandled exception: ${e.toString()}");
      }
    }

  }

  /// put request [title]
  static Future putData({String id="" ,String title="",String body=""}) async {
    try {
      final response = await put(
          Uri.parse("https://jsonplaceholder.typicode.com/posts/${id}"),
          body: {"title": title, "body": body, "id": id});
      print(response.statusCode);
      print(response.body);


    } catch (e) {
      if (e is SocketException) {
        //treat SocketException
        print("Socket exception: ${e.toString()}");
      } else if (e is TimeoutException) {
        //treat TimeoutException
        print("Timeout exception: ${e.toString()}");
      } else {
        print("Unhandled exception: ${e.toString()}");
      }
    }

  }

  /// delete request
  static Future deleteData({String id=""}) async {
    try {
      final response = await put(
          Uri.parse("https://jsonplaceholder.typicode.com/posts/${id}"),
          body: {"id": id});
      print(response.statusCode);
      print(response.body);


    } catch (e) {}

  }

}

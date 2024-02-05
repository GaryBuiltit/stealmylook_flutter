import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stealmylook_flutter/components/result.dart';
import "package:http/http.dart" as http;

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({Key? key, required this.imgBase64}) : super(key: key);
  final String imgBase64;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  var url =
      Uri.https("rcl83fo7si.execute-api.us-east-1.amazonaws.com", "/prod/");
  var data;

  search() async {
    try {
      var requestBody = {"body": widget.imgBase64};

      http.Response response =
          await http.post(url, body: jsonEncode(requestBody));
      data = jsonDecode(response.body);
      print(jsonDecode(response.body));
    } catch (e) {
      print("error sending pic: $e");
    }
  }

  List Results = [];

  @override
  void initState() {
    super.initState();
    search();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            // shirts row
            Container(
              child: Column(
                children: [
                  const Text("Shirts"),
                  Row(
                    children: [
                      Result(
                          imgLink:
                              "https://www.rei.com/media/48a3f17e-e358-4ef3-bd9f-d024aa2183f1.jpg?size=576x768",
                          price: "12.99")
                    ],
                  ),
                ],
              ),
            ),
            // Pants Row
            Container(
              child: Column(
                children: [
                  const Text("Pants"),
                  Row(
                    children: [
                      Result(
                          imgLink:
                              "https://store.nytimes.com/cdn/shop/products/modern-love-shirt-clouds_1024x1024.jpg?v=1571439091",
                          price: "15.99")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

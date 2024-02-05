import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.imgLink, required this.price})
      : super(key: key);
  final String imgLink;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imgLink,
          width: 100,
          height: 100,
        ),
        const SizedBox(height: 5),
        Text(price),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final double price;

  const ServiceCard(
      {super.key,
      required this.title,
      required this.description,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Title - $title",
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              description,
              textAlign: TextAlign.left,
            ),
            Text("Price - $price", textAlign: TextAlign.right),
          ],
        ),
      ),
    );
  }
}

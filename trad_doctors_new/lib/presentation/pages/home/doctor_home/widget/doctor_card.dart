import 'dart:ffi';

import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final int doctorid;
  final String doctorname;
  final String image;
  final double rating;

  const DoctorCard({
    required this.doctorid,
    required this.doctorname,
    required this.rating,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: CircleAvatar(
                backgroundImage: NetworkImage(image),
                radius: double.infinity,
              ),
            ),
            Center(child: Text(doctorname)),
            const SizedBox(
              height: 10,
            ),
            Center(child: Text("Rating $rating")),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

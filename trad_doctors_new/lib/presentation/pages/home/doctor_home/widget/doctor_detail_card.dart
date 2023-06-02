import 'package:flutter/material.dart';
import 'package:trad_doctors_new/presentation/constants/global_variables.dart';


class DoctorDetailCard extends StatelessWidget {
  final String doctorid;
  final String doctorname;
  final String image;
  final double rating;
  final String address;
  final String contact;

  const DoctorDetailCard(
      {required this.doctorid,
      required this.doctorname,
      required this.rating,
      required this.address,
      required this.contact,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('$uri/uploads/${image}'),
              maxRadius: 100,
            ),
            Center(child: Text(doctorname)),
            const SizedBox(
              height: 10,
            ),
            Center(child: Text("Rating $rating")),
            const SizedBox(
              height: 10,
            ),
            const Center(child: Text("Address")),
            Center(child: Text(address)),
            const SizedBox(
              height: 10,
            ),
            const Center(child: Text("Contact")),
            Center(child: Text(contact)),
          ],
        ),
      ),
    );
  }
}

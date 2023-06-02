import 'package:flutter/material.dart';
import 'package:trad_doctors_new/presentation/constants/global_variables.dart';

class PatientCard extends StatelessWidget {
  final String patient_image;
  final String patient_name;
  final String description;
  final String message;
  const PatientCard(
      {required this.patient_image,
      required this.patient_name,
      required this.description,
      required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("$uri/uploads/$patient_image"),
              ),
              GlobalVariables.horizontalSizedBox,
              Text(
                patient_name,
              )
            ],
          ),
          GlobalVariables.verticalSizedBox,
          Text("Description - $description"),
          GlobalVariables.verticalSizedBox,
          Text("My reply- $message"),
        ],
      ),
    );
  }
}

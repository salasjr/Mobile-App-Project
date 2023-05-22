import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';

class CustomDoctorFilter extends StatelessWidget {
  final String text;
  const CustomDoctorFilter({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: GlobalVariables.primaryColor,
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

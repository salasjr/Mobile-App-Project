import 'package:flutter/material.dart';

class AppointmentButtons extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const AppointmentButtons({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}

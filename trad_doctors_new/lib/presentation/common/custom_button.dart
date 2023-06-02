import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const CustomButton({
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
        style: const TextStyle(
            // color: color == null
            //     ? const Color.fromARGB(255, 0, 0, 0)
            //     : const Color.fromARGB(255, 255, 255, 255),
            color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}

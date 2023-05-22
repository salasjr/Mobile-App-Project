import 'package:flutter/material.dart';

class CustomPhoneNumberField extends StatelessWidget {
  final TextEditingController controller;
  const CustomPhoneNumberField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        prefixText: '+251 ',
        labelText: 'Phone number',
        hintText: '9XXXXXXXX',
        prefixStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your phone number';
        }
        return null;
      },
    );
  }
}

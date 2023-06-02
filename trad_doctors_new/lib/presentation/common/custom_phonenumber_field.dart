import 'package:flutter/material.dart';

class CustomPhoneNumberField extends StatelessWidget {
  final TextEditingController controller;
  const CustomPhoneNumberField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isValidPhoneNumber(String phoneNumber) {
      RegExp regex = RegExp(r'^\+2519\d{8}$');

      if (regex.hasMatch(phoneNumber)) {
        return true;
      } else {
        return false;
      }
    }

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
        bool isValid = isValidPhoneNumber('+251${controller.text}');
        if (val == null || val.isEmpty) {
          return 'Enter a your phone number';
        } else if (!isValid) {
          return 'Invalid phone number';
        }
        return null;
      },
    );
  }
}

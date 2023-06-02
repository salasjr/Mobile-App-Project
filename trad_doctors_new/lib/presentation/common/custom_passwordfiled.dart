import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String validation;

  const CustomPasswordField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.validation,
  }) : super(key: key);

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  bool isValidPhoneNumber(String phoneNumber) {
    RegExp regex = RegExp(r'^\+2519\d{8}$');

    if (regex.hasMatch(phoneNumber)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: const OutlineInputBorder(
          // borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 143, 143, 143),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          // borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 143, 143, 143),
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      validator: (val) {
        bool isValid = isValidPhoneNumber('+251${widget.controller.text}');
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

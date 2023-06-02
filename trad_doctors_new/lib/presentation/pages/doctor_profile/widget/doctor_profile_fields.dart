import 'package:flutter/material.dart';

import 'custom_test_editing_field.dart';

class CustomDoctorProfile extends StatefulWidget {
  final String profileInfo;
  final String text;

  const CustomDoctorProfile({
    super.key,
    required this.profileInfo,
    required this.text,
  });

  @override
  State<CustomDoctorProfile> createState() => _CustomDoctorProfileState();
}

class _CustomDoctorProfileState extends State<CustomDoctorProfile> {
  bool edit = false;
  final TextEditingController controller = TextEditingController();

  void togleEdit() {
    setState(() {
      edit = !edit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return edit
        ? UserProfileTextField(
            initialValue: widget.profileInfo,
            label: widget.text,
            onSaved: togleEdit)
        : Container(
            color: const Color.fromARGB(20, 0, 0, 0),
            margin: const EdgeInsets.fromLTRB(20, 6, 30, 10),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "${widget.text} : ${widget.profileInfo}",
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 49, 49, 49)),
                    ),
                  ),
                  TextButton(
                    onPressed: togleEdit,
                    child: const Text(
                      "edit",
                      style: TextStyle(
                        color: Color.fromARGB(255, 8, 65, 112),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}

import 'package:flutter/material.dart';

import '../../../common/custom_textEditing_field.dart';

class CustomPatientProfile extends StatefulWidget {
  final String patientprofile;
  final String text;

  const CustomPatientProfile(
      {super.key, required this.patientprofile, required this.text});

  @override
  State<CustomPatientProfile> createState() => _CustomPatientProfileState();
}

class _CustomPatientProfileState extends State<CustomPatientProfile> {
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
            initialValue: widget.patientprofile,
            label: widget.text,
            onSaved: (value) {
              setState(() {
                // widget.profileInfo = value;
                edit = false;
              });
            },
          )
        : Container(
            color: const Color.fromARGB(20, 0, 0, 0),
            margin: const EdgeInsets.fromLTRB(20, 6, 30, 10),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.text} : ${widget.patientprofile}",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 49, 49, 49)),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        edit = true;
                      });
                    },
                    child: const Text(
                      "edit",
                      style: TextStyle(
                        color: Color.fromARGB(255, 8, 65, 112),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

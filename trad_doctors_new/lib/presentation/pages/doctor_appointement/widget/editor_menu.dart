import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trad_doctors_new/application/bloc/doctor_appointment_bloc/doctor_appointment_bloc.dart';



class MessageMenu extends StatelessWidget {
  final descriptionController = TextEditingController();
  final String token;
  final int id;
  Map attributes;
  final List indexes;

  final GlobalKey<FormState> descriptionGlobalKey = GlobalKey<FormState>();

  MessageMenu(
      {required this.token,
      required this.id,
      required this.attributes,
      required this.indexes});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: descriptionGlobalKey,
        child: AlertDialog(
          title: const Text('Your response'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                validator: (val) {
                  if (descriptionController.text.isEmpty) {
                    return 'Enter your message here';
                  }
                  return null;
                },
                maxLength: 70,
                maxLines: 2,
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Message',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                descriptionController.dispose();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (descriptionController.text == "") return;

                attributes["message"] = descriptionController.text;
                BlocProvider.of<DoctorAppointmentBloc>(context).add(
                    UpdateDoctorAppointment(
                        token: token,
                        id: id,
                        attribute: attributes,
                        indexes: indexes));

                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trad_doctors_new/application/bloc/patient_appointment_bloc/patient_appointment_bloc.dart';


class EditMenu extends StatelessWidget {
  final descriptionController = TextEditingController();
  final String token;
  final int id;
  Map attribute;
  final int index;

  final GlobalKey<FormState> descriptionGlobalKey = GlobalKey<FormState>();

  EditMenu(
      {required this.token,
      required this.id,
      required this.index,
      required this.attribute});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: descriptionGlobalKey,
        child: AlertDialog(
          title: const Text('Update your description'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                validator: (val) {
                  if (descriptionController.text.isEmpty) {
                    return 'Enter your description';
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
                attribute["message"] = descriptionController.text;
                BlocProvider.of<PatientAppointmentBloc>(context).add(
                    UpdateAppointment(
                        attribute: attribute,
                        id: id,
                        index: index,
                        token: token));
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

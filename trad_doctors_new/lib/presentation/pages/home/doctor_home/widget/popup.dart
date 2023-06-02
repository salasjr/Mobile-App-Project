import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';
import 'package:trad_doctors_new/application/bloc/patient_appointment_bloc/patient_appointment_bloc.dart';
import 'package:trad_doctors_new/domain/appointemt_dto.dart';

class CreateAppointmentDialog extends StatelessWidget {
  final _descriptionController = TextEditingController();
  final GlobalKey<FormState> descriptionGlobalKey = GlobalKey<FormState>();
  final int id;

  CreateAppointmentDialog({required this.id});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: descriptionGlobalKey,
        child: AlertDialog(
          title: const Text('Create Appointment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                validator: (val) {
                  if (_descriptionController.text.isEmpty) {
                    return 'Enter your case description';
                  }
                  return null;
                },
                maxLength: 70,
                maxLines: 2,
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Case Description',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                int patientid =
                    BlocProvider.of<LoginCubit>(context).state.user.id;
                String token =
                    BlocProvider.of<LoginCubit>(context).state.user.token;
                BlocProvider.of<PatientAppointmentBloc>(context).add(
                  CreateAppointment(
                    token: token,
                    appointment: Appointment(
                      patient_id: patientid,
                      doctor_id: id,
                      description: _descriptionController.text,
                    ),
                  ),
                );
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

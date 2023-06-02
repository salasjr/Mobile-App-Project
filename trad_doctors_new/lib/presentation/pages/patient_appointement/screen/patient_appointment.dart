import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trad_doctors_new/application/bloc/patient_appointment_bloc/patient_appointment_bloc.dart';
import 'package:trad_doctors_new/presentation/common/errro_screen.dart';
import 'package:trad_doctors_new/presentation/pages/patient_appointement/widget/patient_appoitment_card.dart';



class PatientAppointmentPage extends StatefulWidget {
  const PatientAppointmentPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PatientAppointmentPageState createState() => _PatientAppointmentPageState();
}

class _PatientAppointmentPageState extends State<PatientAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appointments"),
        centerTitle: true,
      ),
      body: BlocBuilder<PatientAppointmentBloc, PatientAppointmentState>(
        builder: (context, state) {
          if (state is PatientAppointmentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PateintAppointmentLoaded) {
            return ListView.builder(
                itemCount: state.appointments.length,
                itemBuilder: (BuildContext context, int index) {
                  return PatientAppointmentCard(
                    appointment: state.appointments[index],
                    index: index,
                  );
                });
          }
          return const ErrorScreen();
        },
      ),
    );
  }
}

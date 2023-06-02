import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';
import 'package:trad_doctors_new/application/bloc/doctor_appointment_bloc/doctor_appointment_bloc.dart';
import 'package:trad_doctors_new/application/bloc/patient_appointment_bloc/patient_appointment_bloc.dart';
import 'package:trad_doctors_new/domain/appointemt_dto.dart';
import 'package:trad_doctors_new/domain/patient_appoint_dto.dart';
import 'package:trad_doctors_new/presentation/constants/global_variables.dart';
import 'package:trad_doctors_new/presentation/pages/patient_appointement/widget/edit.dart';

class PatientAppointmentCard extends StatelessWidget {
  final PatientAppointment appointment;
  final int index;

  final Map statusColor = {
    "accepted": Colors.green,
    "pending": Colors.grey,
    "rejected": Colors.red,
    "done": Colors.blue,
  };

  PatientAppointmentCard(
      {super.key, required this.appointment, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      '$uri/uploads/${appointment.profilePicture}'),
                ),
                Text(appointment.fullname),
                Text(appointment.status,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: statusColor[appointment.status],
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Text("message - ${appointment.message}"),
            Text("description - ${appointment.case_description}"),
            Text("Address - ${appointment.address}"),
            Text("Contact - ${appointment.phoneNumber}"),
            StatusHandler(
              appointment: appointment,
              index: index,
            ),
            ElevatedButton(
                onPressed: () {
                  String token =
                      BlocProvider.of<LoginCubit>(context).state.user.token;
                  int id = appointment.appointment_id;
                  int curr = index;
                  BlocProvider.of<PatientAppointmentBloc>(context).add(
                      DeleteAppointment(
                          token: token, appointment_id: id, index: curr));
                },
                child: Text("Delete"))
          ],
        ),
      ),
    );
  }
}

class StatusHandler extends StatefulWidget {
  final appointment;
  final index;

  const StatusHandler({super.key, required this.appointment, this.index});
  @override
  State<StatusHandler> createState() => _StatusHandlerState();
}

class _StatusHandlerState extends State<StatusHandler> {
  @override
  Widget build(BuildContext context) {
    if (widget.appointment.status == "pending") {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                String token =
                    BlocProvider.of<LoginCubit>(context).state.user.token;
                int id = widget.appointment.appointment_id;
                Map attributes = {"status": widget.appointment.status};

                showDialog(
                    context: context,
                    builder: (BuildContext _) {
                      return BlocProvider.value(
                          value:
                              BlocProvider.of<PatientAppointmentBloc>(context),
                          child: EditMenu(
                            token: token,
                            id: id,
                            index: widget.index,
                            attribute: attributes,
                          ));
                    });
              },
              child: const Text("Edit")),
        ],
      );
    } else if (widget.appointment.status == "done") {
      if (widget.appointment.rating == 0) {
        int selected = 0;
        return Column(
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      selected = 1;
                    },
                    child: Text("1")),
                TextButton(
                    onPressed: () {
                      selected = 2;
                    },
                    child: Text("2")),
                TextButton(
                    onPressed: () {
                      selected = 3;
                    },
                    child: Text("3")),
                TextButton(
                    onPressed: () {
                      selected = 4;
                    },
                    child: Text("4")),
                TextButton(
                    onPressed: () {
                      selected = 5;
                    },
                    child: Text("5"))
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  if (selected == 0) return;
                  String token =
                      BlocProvider.of<LoginCubit>(context).state.user.token;
                  int id = widget.appointment.appointment_id;
                  BlocProvider.of<PatientAppointmentBloc>(context)
                      .add(RateAppointment(
                    appointment_id: id,
                    rating: selected,
                    token: token,
                    index: widget.index,
                    doctorid: widget.appointment.doctor_id,
                  ));
                },
                child: Text("Rate"))
          ],
        );
      }
    }
    return Column();
  }
}

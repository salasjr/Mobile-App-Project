import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';

import 'package:trad_doctors_new/application/bloc/doctor_appointment_bloc/doctor_appointment_bloc.dart';
import 'package:trad_doctors_new/presentation/common/errro_screen.dart';
import 'package:trad_doctors_new/presentation/constants/global_variables.dart';
import 'package:trad_doctors_new/presentation/pages/doctor_appointement/widget/editor_menu.dart';
import 'package:trad_doctors_new/presentation/pages/doctor_appointement/widget/patient_card.dart';

class RejectedAppointment extends StatefulWidget {
  const RejectedAppointment({super.key});

  @override
  State<RejectedAppointment> createState() => _RejectedAppointmentState();
}

class _RejectedAppointmentState extends State<RejectedAppointment> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAppointmentBloc, DoctorAppointmentState>(
        builder: (context, state) {
      if (state is DoctorAppointmentLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is DoctorAppointmentLoaded) {
        print("------------pending---${state.appointments[2]}");

        return ListView.builder(
          itemCount: state.appointments[2].length,
          itemBuilder: (BuildContext context, int index) {
            final appointment = state.appointments[2][index];
            return Card(
              child: Column(children: [
                PatientCard(
                  patient_image: appointment.profilePicture,
                  patient_name: appointment.fullname,
                  description: appointment.case_description,
                  message: appointment.message,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        String token = BlocProvider.of<LoginCubit>(context)
                            .state
                            .user
                            .token;
                        int id = appointment.appointment_id;
                        Map attributes = {"status": "accepted"};
                        List curr = [2, index];

                        showDialog(
                          context: context,
                          builder: (BuildContext _) {
                            return BlocProvider.value(
                              value: BlocProvider.of<DoctorAppointmentBloc>(
                                  context),
                              child: MessageMenu(
                                  token: token,
                                  id: id,
                                  attributes: attributes,
                                  indexes: curr),
                            );
                          },
                        );
                      },
                      child: const Text("Accept"),
                    ),
                    GlobalVariables.horizontalSizedBox,
                    ElevatedButton(
                      onPressed: () {
                        String token = BlocProvider.of<LoginCubit>(context)
                            .state
                            .user
                            .token;
                        int id = appointment.appointment_id;
                        List curr = [2, index];
                        BlocProvider.of<DoctorAppointmentBloc>(context).add(
                            DeleteDoctorAppointment(
                                token: token, id: id, indexes: curr));
                      },
                      child: const Text("Delete"),
                    )
                  ],
                )
              ]),
            );
          },
        );
      } else {
        int id = BlocProvider.of<LoginCubit>(context).state.user.id;
        String token = BlocProvider.of<LoginCubit>(context).state.user.token;
        BlocProvider.of<DoctorAppointmentBloc>(context)
            .add(LoadDoctorAppointment(token: token, id: id));

        return const ErrorScreen();
      }
    });
  }
}

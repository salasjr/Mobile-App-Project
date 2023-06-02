import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';
import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';
import 'package:trad_doctors_new/application/bloc/patient_appointment_bloc/patient_appointment_bloc.dart';
import 'package:trad_doctors_new/application/bloc/services_bloc/services_bloc_bloc.dart';
import 'package:trad_doctors_new/domain/appointemt_dto.dart';
import 'package:trad_doctors_new/domain/doctor_dto.dart';
import 'package:trad_doctors_new/presentation/common/custom_button.dart';
import 'package:trad_doctors_new/presentation/constants/global_variables.dart';
import 'package:trad_doctors_new/presentation/pages/home/doctor_home/widget/doctor_detail_card.dart';
import 'package:trad_doctors_new/presentation/pages/home/doctor_home/widget/popup.dart';
import 'package:trad_doctors_new/presentation/pages/home/doctor_home/widget/service_card.dart';


class DoctorDetail extends StatefulWidget {
  final Doctor doctor;
  const DoctorDetail({super.key, required this.doctor});

  @override
  State<StatefulWidget> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {
  final TextEditingController _descriptionController = TextEditingController();
  final descriptionGlobalKey = GlobalKey<FormState>();
  @override
  void initState() {
    print('--------${BlocProvider.of<PatientAppointmentBloc>(context).state}');

    super.initState();
  }

  _showAppointmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                                doctor_id: widget.doctor.id,
                                description: _descriptionController.text)));
                    Navigator.of(context).pop();
                    // Close the dialog
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor detail"),
        backgroundColor: GlobalVariables.primaryColor,
      ),
      body: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          if (state is ServicesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ServicesLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Column(
                  children: [
                    DoctorDetailCard(
                      doctorid: widget.doctor.id.toString(),
                      image: widget.doctor.profilePicture,
                      doctorname: widget.doctor.fullname,
                      rating: widget.doctor.ratingCount == 0
                          ? 0
                          : widget.doctor.rating / widget.doctor.ratingCount,
                      address: widget.doctor.address,
                      contact: widget.doctor.phoneNumber,
                    ),
                    if (BlocProvider.of<LoginCubit>(context).state.user.role ==
                        "patient")
                      CustomButton(
                        text: "Book Appointment",
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext _) {
                              return BlocProvider.value(
                                value: BlocProvider.of<PatientAppointmentBloc>(
                                    context),
                                child: CreateAppointmentDialog(
                                    id: widget.doctor.id),
                              ); // Pass the doctor's ID
                            },
                          );
                        },
                      ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(.0),
                      child: Text(
                        "Services",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: state.services.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ServiceCard(
                            title: state.services[index].title,
                            description: state.services[index].description,
                            price: state.services[index].price);
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}

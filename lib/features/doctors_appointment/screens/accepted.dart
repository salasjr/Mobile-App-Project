import 'package:flutter/material.dart';
import 'package:trad_doctors/constants/global_variables.dart';

import '../widgets/custom_filter_button.dart';

class AccptedAppointment extends StatefulWidget {
  const AccptedAppointment({super.key});

  @override
  State<AccptedAppointment> createState() => _AccptedAppointmentState();
}

class _AccptedAppointmentState extends State<AccptedAppointment> {
  final List<Acceptedappointment> acceptedAppointments = [
    Acceptedappointment(
        name: 'Salahadin Juhar',
        caseDescription:
            'The patient is going to give some description about her illness for the appointment',
        photoUrl: 'images/trad_doctors_banner.png',
        date: '10/20/2022',
        contact: "251967705214"),
    Acceptedappointment(
        name: 'John desta ',
        caseDescription:
            'The patient is going to give some description about her illness for the appointment',
        photoUrl: 'images/trad_doctors_banner.png',
        date: '10/20/2022',
        contact: "251967705214"),
    Acceptedappointment(
        name: 'sura workayehu',
        caseDescription:
            'The patient is going to give some description about her illness for the appointment',
        photoUrl: 'images/trad_doctors_banner.png',
        date: '10/20/2022',
        contact: "251967705214"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.primaryColor,
        title: const Center(child: Text("Appointment")),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  CustomDoctorFilter(
                    text: 'New',
                  ),
                  CustomDoctorFilter(
                    text: 'Accepted',
                  ),
                  CustomDoctorFilter(
                    text: 'Rejected',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: acceptedAppointments.length,
              itemBuilder: (BuildContext context, int index) {
                final appointment = acceptedAppointments[index];
                return SizedBox(
                  // height: 270,
                  child: Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(20, 10, 10, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 25, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundImage: AssetImage(
                                      'assets/images/trad_doctors_banner.png'),
                                ),
                              ),
                              Text(
                                appointment.name,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 10, 10, 5),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Case description: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  TextSpan(
                                    text: appointment.caseDescription,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 15, 5, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 0, 0, 10),
                                child: Column(
                                  children: [
                                    Text(
                                      'Appointment date: ${appointment.date}',
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                        'Phone number: ${appointment.contact}'),
                                  ],
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: Text(
                                  "Accepted",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 1, 113, 5)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Acceptedappointment {
  final String name;
  final String caseDescription;
  final String photoUrl;
  final String date;
  final String contact;

  Acceptedappointment({
    required this.name,
    required this.caseDescription,
    required this.photoUrl,
    required this.date,
    required this.contact,
  });
}

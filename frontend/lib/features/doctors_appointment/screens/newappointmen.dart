import 'package:flutter/material.dart';
import 'package:trad_doctors/constants/global_variables.dart';

import '../widgets/custom_filter_button.dart';

class NewAppointment extends StatefulWidget {
  const NewAppointment({super.key});

  @override
  State<NewAppointment> createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  final List<PatientAppointment> patientAppointments = [
    PatientAppointment(
        name: 'Salahadin Juhar',
        caseDescription:
            'The patient is going to give some description about her illness for the appointment',
        photoUrl: 'images/pexels-photo-220453.webp'),
    PatientAppointment(
        name: 'John desta ',
        caseDescription:
            'The patient is going to give some description about her illness for the appointment',
        photoUrl: 'images/images.jpg'),
    PatientAppointment(
        name: 'sura workayehu',
        caseDescription:
            'The patient is going to give some description about her illness for the appointment',
        photoUrl: 'images/images.jpg'),
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
          Container(
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
          Expanded(
            child: ListView.builder(
              itemCount: patientAppointments.length,
              itemBuilder: (BuildContext context, int index) {
                final appointment = patientAppointments[index];
                return SizedBox(
                  // height: 300,
                  child: Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(20, 10, 10, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 10.0, right: 10.0),
                          alignment: Alignment.topRight,
                          child: const Text(
                            "New",
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 80, 145),
                                fontWeight: FontWeight.w600,
                                fontSize: 15),
                          ),
                        ),
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
                          margin: const EdgeInsets.fromLTRB(5, 0, 10, 15),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Text(appointment.caseDescription),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Container(
                                  height: 40,
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color.fromARGB(
                                          255, 130, 33, 26)),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Reject",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Container(
                                  height: 40,
                                  margin:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color.fromARGB(
                                          255, 13, 49, 126)),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Accept",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
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

class PatientAppointment {
  final String name;
  final String caseDescription;
  final String photoUrl;

  PatientAppointment({
    required this.name,
    required this.caseDescription,
    required this.photoUrl,
  });
}

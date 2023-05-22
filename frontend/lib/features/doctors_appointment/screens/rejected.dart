import 'package:flutter/material.dart';
import 'package:trad_doctors/constants/global_variables.dart';

import '../widgets/custom_filter_button.dart';

class RejectedAppointment extends StatefulWidget {
  const RejectedAppointment({super.key});

  @override
  State<RejectedAppointment> createState() => _RejectedAppointmentState();
}

class _RejectedAppointmentState extends State<RejectedAppointment> {
  final List<rejected> rejectedappointments = [
    rejected(
        name: 'Salahadin Juhar',
        caseDescription:
            'The patient is going to give some description about her illness for the appointment',
        photoUrl: 'images/trad_doctors_banner.png'),
    rejected(
        name: 'John desta ',
        caseDescription:
            'The patient is going to give some description about her illness for the appointment',
        photoUrl: 'images/trad_doctors_banner.png'),
    rejected(
      name: 'sura workayehu',
      caseDescription:
          'The patient is going to give some description about her illness for the appointment',
      photoUrl: 'images/trad_doctors_banner.png',
    ),
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
              itemCount: rejectedappointments.length,
              itemBuilder: (BuildContext context, int index) {
                final appointment = rejectedappointments[index];
                return Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.fromLTRB(20, 8, 10, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 10.0, right: 10.0),
                        alignment: Alignment.topRight,
                        child: const Text(
                          "Rejected",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                          ),
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
                        margin: const EdgeInsets.fromLTRB(5, 10, 10, 15),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Text(
                              'Case discription :${appointment.caseDescription}'),
                        ),
                      ),
                    ],
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

class rejected {
  final String name;
  final String caseDescription;
  final String photoUrl;

  rejected({
    required this.name,
    required this.caseDescription,
    required this.photoUrl,
  });
}

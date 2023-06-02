import 'package:flutter/material.dart';

import 'package:trad_doctors_new/presentation/constants/global_variables.dart';
import 'package:trad_doctors_new/presentation/pages/doctor_appointement/screen/accepted.dart';
import 'package:trad_doctors_new/presentation/pages/doctor_appointement/screen/completed.dart';
import 'package:trad_doctors_new/presentation/pages/doctor_appointement/screen/pending.dart';
import 'package:trad_doctors_new/presentation/pages/doctor_appointement/screen/rejected.dart';

class DoctorAppointment extends StatefulWidget {
  const DoctorAppointment({Key? key}) : super(key: key);

  @override
  State<DoctorAppointment> createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalVariables.primaryColor,
          title: const Center(child: Text("Appointment")),
          bottom: TabBar(
            onTap: (tabIndex) {},
            tabs: const [
              Tab(text: "Pending"),
              Tab(text: "Accepted"),
              Tab(text: "Rejected"),
              Tab(text: "Completed")
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PendingAppointment(),
            AccptedAppointment(),
            RejectedAppointment(),
            CompletedAppointment()
          ],
        ),
      ),
    );
  }
}

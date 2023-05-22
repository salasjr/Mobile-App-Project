import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trad_doctors/features/patient_profile/widgets/custom_patient.dart';
import 'package:trad_doctors/providers/user_provider.dart';

import '../../../constants/global_variables.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({super.key});

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Profile")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(20, 0, 0, 0),
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      radius: 150.0,
                      backgroundImage:
                          NetworkImage('$uri/uploads/${user.profilePicture}'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Basic personal information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomPatientProfile(
                patientprofile: user.fullname, text: "Full Name"),
            CustomPatientProfile(patientprofile: user.address, text: "Address"),
            CustomPatientProfile(
                patientprofile: '+251-${user.phoneNumber}', text: "Contact"),
            const SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 28, 0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Change Password",
                      style: TextStyle(color: Color.fromARGB(255, 105, 14, 7)),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

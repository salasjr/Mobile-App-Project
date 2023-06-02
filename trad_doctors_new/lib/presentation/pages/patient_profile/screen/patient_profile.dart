// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';
import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';
import 'package:trad_doctors_new/presentation/constants/global_variables.dart';
import 'package:trad_doctors_new/presentation/constants/utils.dart';
import 'package:trad_doctors_new/presentation/pages/patient_profile/widget/custom_patient.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({super.key});

  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Profile")),
      ),
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return SingleChildScrollView(
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
                          radius: 120.0,
                          backgroundImage: NetworkImage(
                            '$uri/uploads/${state.user.profilePicture}',
                          ),
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
                    patientprofile: state.user.fullname, text: "Full Name"),
                CustomPatientProfile(
                    patientprofile: state.user.address, text: "Address"),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  color: const Color.fromARGB(20, 0, 0, 0),
                  margin: const EdgeInsets.fromLTRB(20, 6, 30, 10),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 0, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Phone number : +251 ${state.phoneNumber}",
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 49, 49, 49)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 28, 0),
                            child: TextButton(
                              onPressed: () async {
                                bool result = false;
                                result =
                                    await BlocProvider.of<LoginCubit>(context)
                                        .deleteProfile(
                                            state.user.id, state.user.token);
                                if (result) {
                                  GoRouter.of(context).go("/");
                                  showSnackBar(context, "Account deleted");
                                } else {
                                  showSnackBar(
                                      context, "Could not delete account.");
                                }
                              },
                              child: const Text(
                                "Delete Account",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 105, 14, 7)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 28, 0),
                            child: TextButton(
                              onPressed: () {
                                GoRouter.of(context).push("/changepassword");
                              },
                              child: const Text(
                                "Change Password",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 105, 14, 7)),
                              ),
                            ),
                          ),
                        ),
                      ]),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

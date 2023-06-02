// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';
import 'package:trad_doctors_new/presentation/constants/global_variables.dart';
import 'package:trad_doctors_new/presentation/constants/utils.dart';
import 'package:trad_doctors_new/presentation/pages/doctor_profile/widget/doctor_profile_fields.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({super.key});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          showSnackBar(context, state.error);
        }
      },
      child: Scaffold(
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
                              radius: 100.0,
                              backgroundImage: NetworkImage(
                                  '$uri/uploads/${state.user.profilePicture}')),
                          const SizedBox(
                            height: 10,
                          ),
                          state.user.ratingCount == 0
                              ? const Text(
                                  "Rating 0",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )
                              : Text(
                                  "Rating ${state.user.rating / state.user.ratingCount}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Business / tax-id: ${state.user.businessId}",
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 10,
                          )
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
                    height: 20,
                  ),
                  CustomDoctorProfile(
                    profileInfo: state.user.fullname,
                    text: "Full Name",
                  ),
                  CustomDoctorProfile(
                      profileInfo: state.user.businessName,
                      text: "Bussiness Name"),
                  CustomDoctorProfile(
                      profileInfo: state.user.address, text: "Address"),
                  CustomDoctorProfile(
                      profileInfo: '+251-${state.user.phoneNumber}',
                      text: "Contact"),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
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
                              } else {
                                showSnackBar(
                                    context, "Could not delete account!");
                              }
                            },
                            child: const Text(
                              "Delete Account",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 105, 14, 7)),
                            ),
                          ),
                        ),
                        Padding(
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
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

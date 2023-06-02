import 'package:flutter/material.dart';
import 'package:trad_doctors_new/presentation/constants/global_variables.dart';
import 'package:trad_doctors_new/presentation/pages/home/doctor_home/screen/doctors_view.dart';
import 'package:trad_doctors_new/presentation/pages/patient_appointement/screen/patient_appointment.dart';
import 'package:trad_doctors_new/presentation/pages/patient_profile/screen/patient_profile.dart';

class PatientBottomBar extends StatefulWidget {
  const PatientBottomBar({super.key});

  @override
  State<PatientBottomBar> createState() => _PatientBottomBarState();
}

class _PatientBottomBarState extends State<PatientBottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  List<Widget> pages = [
    const DoctorView(),
    const PatientAppointmentPage(),
    const PatientProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: Colors.black,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: (value) {
          setState(() {
            _page = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          // Home page
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 0
                    ? GlobalVariables.selectedNavBarColor
                    : GlobalVariables.backgroundColor,
                width: bottomBarBorderWidth,
              ))),
              child: const Icon(Icons.home_outlined),
            ),
            label: "",
          ),

          //appointment
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 1
                    ? GlobalVariables.selectedNavBarColor
                    : GlobalVariables.backgroundColor,
                width: bottomBarBorderWidth,
              ))),
              child: const Icon(Icons.lock_clock),
            ),
            label: "",
          ),

          // profile page
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 2
                    ? GlobalVariables.selectedNavBarColor
                    : GlobalVariables.backgroundColor,
                width: bottomBarBorderWidth,
              ))),
              child: const Icon(Icons.person_outline),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}

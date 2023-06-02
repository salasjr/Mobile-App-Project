import 'package:flutter/material.dart';
import 'package:trad_doctors_new/presentation/constants/global_variables.dart';
import 'package:trad_doctors_new/presentation/pages/doctor_appointement/screen/doctor_appointment.dart';
import 'package:trad_doctors_new/presentation/pages/doctor_profile/screen/doctor_profile.dart';
import 'package:trad_doctors_new/presentation/pages/doctor_service/screen/doctor_screen.dart';

import 'doctors_view.dart';

class DoctorBottomBar extends StatefulWidget {
  const DoctorBottomBar({super.key});

  @override
  State<DoctorBottomBar> createState() => _DoctorBottomBarState();
}

class _DoctorBottomBarState extends State<DoctorBottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  List<Widget> pages = [
    const DoctorView(),
    const Services(),
    const DoctorAppointment(),
    const DoctorProfile(),
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

          // service page
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
              child: const Icon(Icons.medical_services),
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
                color: _page == 2
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
                color: _page == 3
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

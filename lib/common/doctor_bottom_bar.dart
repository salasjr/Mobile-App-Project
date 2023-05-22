import 'package:flutter/material.dart';
import 'package:trad_doctors/constants/global_variables.dart';
import 'package:trad_doctors/features/doctor_profile/screens/doctor_profile.dart';
import 'package:trad_doctors/features/doctor_service/screens/add_service.dart';
import 'package:trad_doctors/features/doctors_appointment/screens/accepted.dart';
import 'package:trad_doctors/features/doctors_appointment/screens/newappointmen.dart';
import 'package:trad_doctors/features/doctors_appointment/screens/rejected.dart';
import 'package:trad_doctors/features/home/screens/home_screen.dart';

import '../features/doctor_service/screens/services.dart';

class DoctorBottomBar extends StatefulWidget {
  static const routeName = '/actual-home';
  const DoctorBottomBar({super.key});

  @override
  State<DoctorBottomBar> createState() => _DoctorBottomBarState();
}

class _DoctorBottomBarState extends State<DoctorBottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  List<Widget> pages = [
    const HomeScreen(),
    const Services(),
    const NewAppointment(),
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

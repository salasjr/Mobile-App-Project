import 'package:flutter/material.dart';
import 'package:trad_doctors/common/doctor_bottom_bar.dart';
import 'package:trad_doctors/common/patient_bottom_bar.dart';
import 'package:trad_doctors/features/auth/screens/auth_screen.dart';
import 'package:trad_doctors/features/home/screens/home_screen.dart';
import 'package:trad_doctors/features/landing/screens/landing_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case DoctorBottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const DoctorBottomBar(),
      );
    case PatientBottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const DoctorBottomBar(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case LandingPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LandingPage(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Screen doesn't exist!"),
          ),
        ),
      );
  }
}

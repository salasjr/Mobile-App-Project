import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trad_doctors/constants/global_variables.dart';
import 'package:trad_doctors/features/auth/services/auth_service.dart';
import 'package:trad_doctors/providers/all_doctors_provider.dart';
import 'package:trad_doctors/router.dart';
import 'common/doctor_bottom_bar.dart';
import 'common/patient_bottom_bar.dart';
import 'features/landing/screens/landing_screen.dart';
import 'features/loading/loading_screen.dart';
import 'providers/user_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AllDoctorsProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthService authService = AuthService();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    authService.getUserData(context).then((userInfo) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trad-Doctors',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme:
            const ColorScheme.light(primary: GlobalVariables.primaryColor),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      // home: const BottomBar());
      home: _isLoading
          ? const LoadingScreen()
          : Provider.of<UserProvider>(context).user.token.isNotEmpty
              ? Provider.of<UserProvider>(context).user.role == "doctor"
                  ? const DoctorBottomBar()
                  : const PatientBottomBar()
              : const LandingPage(),
    );
  }
}

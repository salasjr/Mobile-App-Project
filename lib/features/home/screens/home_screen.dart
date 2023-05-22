import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trad_doctors/constants/global_variables.dart';
import 'package:trad_doctors/features/auth/services/auth_service.dart';
import 'package:trad_doctors/features/home/screens/doctor_view.dart';
import 'package:trad_doctors/providers/user_provider.dart';
import '../../../constants/utils.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService authService = AuthService();
  void signOut() {
    authService.signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: GlobalVariables.primaryColor,
              ),
            ),
            title: const Text("Home"),
            actions: [
              TextButton(
                onPressed: signOut,
                child: const Text(
                  "Sign out",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        body: const DoctorView());

    //   body: Column(
    //     children: [
    //       Text(user.toJson()),
    //       Expanded(
    //         child: CircleAvatar(
    //           backgroundImage:
    //               NetworkImage('$uri/uploads/${user.profilePicture}'),
    //           radius: double.infinity,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trad_doctors_new/presentation/common/custom_button.dart';


class LandingPage extends StatefulWidget {
  static const routeName = '/landing-page';
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Traditional Doctors"),
        actions: [
          TextButton(
            onPressed: () {
              GoRouter.of(context).push('/login');
            },
            child: const Text(
              "Sign in",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://th.bing.com/th/id/R.f030e7660f7eab9064c9371f38062c6f?rik=kSan7EQy5Z4Ang&pid=ImgRaw&r=0"),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      color: Color.fromARGB(255, 120, 120, 120),
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: SizedBox(
                      width: 200,
                      height: 180,
                      child: Card(
                        elevation: 4.0, // Sets the elevation of the card
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Sets the rounded corners of the card
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              title: Text(
                                'Are you a doctor?',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                              child: Text(
                                'Register and get started giving your service.',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Spacer(),
                            CustomButton(
                                text: "Sign up as a doctor",
                                onTap: () {
                                  GoRouter.of(context).push("/doctorsignup");
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: SizedBox(
                      width: 200,
                      height: 180,
                      child: Card(
                        elevation: 4.0, // Sets the elevation of the card
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Sets the rounded corners of the card
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              title: Text(
                                'Need a doctor?',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                              child: Text(
                                'Register and explor our experienced doctors.',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const Spacer(),
                            CustomButton(
                                text: "Sign up as a clinet",
                                onTap: () {
                                  GoRouter.of(context).push('/patientsignup');
                                }),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

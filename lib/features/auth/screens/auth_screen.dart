import 'package:flutter/material.dart';
import 'package:trad_doctors/common/custom_textfield.dart';
import 'package:trad_doctors/constants/global_variables.dart';
import 'package:trad_doctors/features/auth/services/auth_service.dart';
import '../../../common/custom_button.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void swich() {
    if (_auth == Auth.signup) {
      setState(() {
        _auth = Auth.signin;
      });
    } else {
      setState(() {
        _auth = Auth.signup;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_auth == Auth.signup)
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(1, 5, 0, 0),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            controller: _nameController,
                            hintText: "Full name",
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _emailController,
                            hintText: "email",
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: "password",
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: "Sign up",
                            onTap: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                // signUpUser();
                                () {};
                              }
                            },
                          ),
                          const SizedBox(height: 50),
                          Center(
                            child: GestureDetector(
                              onTap: swich,
                              child: const Text.rich(
                                TextSpan(
                                  text: "Already have an account? ",
                                  style: TextStyle(fontSize: 15),
                                  children: [
                                    TextSpan(
                                      text: "Sign in",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (_auth == Auth.signin)
                  Container(
                    padding: const EdgeInsets.all(20),
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                      key: _signInFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(1, 5, 0, 0),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            controller: _emailController,
                            hintText: "email",
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: "password",
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            text: "Sign in",
                            onTap: () {
                              if (_signInFormKey.currentState!.validate()) {
                                // signInUser();
                                () {};
                              }
                            },
                          ),
                          const SizedBox(height: 50),
                          Center(
                            child: GestureDetector(
                              onTap: swich,
                              child: const Text.rich(
                                TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(fontSize: 15),
                                  children: [
                                    TextSpan(
                                      text: "Create new one",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

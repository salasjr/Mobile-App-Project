import 'package:flutter/material.dart';

import '../../../common/custom_passwordfield.dart';
import '../../../common/custom_phonenumber_field.dart';
import '../../../common/custom_textfield.dart';
import '../../../constants/global_variables.dart';

class AuthPageone extends StatefulWidget {
  final int pageNumber;
  final int maxPage;
  final VoidCallback swich;
  final VoidCallback pageStateIncrement;

  const AuthPageone({
    Key? key,
    required this.swich,
    required this.pageStateIncrement,
    required this.pageNumber,
    required this.maxPage,
  }) : super(key: key);

  @override
  State<AuthPageone> createState() => _AuthPageoneState();
}

class _AuthPageoneState extends State<AuthPageone> {
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  late int pageNumber;
  late int maxPage;

  @override
  void initState() {
    super.initState();
    pageNumber = widget.pageNumber;
    maxPage = widget.maxPage;
  }

  @override
  void dispose() {
    super.dispose();
    _fullnameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _signUpFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Text(
                "Welcome, Sign up for free",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 66, 66, 66),
                ),
              ),
            ),
            const SizedBox(height: 50),
            CustomTextField(
                controller: _fullnameController, hintText: "Fullname"),
            const SizedBox(height: 10),
            CustomPhoneNumberField(controller: _phoneNumberController),
            const SizedBox(height: 10),
            CustomPasswordField(
              controller: _passwordController,
              labelText: 'password',
              validation: 'Enter your password',
            ),
            const SizedBox(height: 10),
            CustomPasswordField(
                controller: _confirmPasswordController,
                labelText: "Confirm password",
                validation: "Confirm password"),
            const SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onTap: widget.swich,
                child: const Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(fontSize: 15),
                    children: [
                      TextSpan(
                        text: "Sign in",
                        style: TextStyle(
                          fontSize: 15,
                          color: GlobalVariables.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 136),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Previous",
                    style: TextStyle(color: Color.fromARGB(255, 151, 151, 151)),
                  ),
                ),
                const Text(
                  "1/3",
                  style: TextStyle(
                      color: Color.fromARGB(255, 166, 166, 166),
                      fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () => widget.pageStateIncrement,

                  // onPressed: () {
                  //   if (_signUpFormKey.currentState!.validate()) {
                  //     signUpInputValidate;
                  //   }
                  // },
                  child: const Text(
                    "Next",
                    style: TextStyle(color: GlobalVariables.primaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

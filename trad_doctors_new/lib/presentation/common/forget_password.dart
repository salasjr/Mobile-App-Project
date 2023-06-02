import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';
import 'package:trad_doctors_new/presentation/common/custom_phonenumber_field.dart';
import 'package:trad_doctors_new/presentation/common/custom_textfield.dart';
import 'package:trad_doctors_new/presentation/constants/utils.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _answer = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  List<String> secretQuestions = [
    "What is your mother's name?",
    "What is your father's name?",
    "What is your nick name?",
    "What is your city?",
  ];
  int currIndex = 0;

  void changeQuesion() {
    setState(() {
      currIndex += 1;
      currIndex %= secretQuestions.length;
    });
  }

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
          title: const Text("Login"),
          centerTitle: true,
        ),
        body: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: _globalKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      const Text(
                        "Forget your passowrd",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 61, 61, 61)),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Enter your phone number",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomPhoneNumberField(controller: _phoneNumber),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        secretQuestions[currIndex],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(controller: _answer, hintText: 'Answer'),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: changeQuesion,
                          child: const Text("Change another question?")),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Enter your new password",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          controller: _newPassword, hintText: 'New password'),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_globalKey.currentState!.validate()) {
                            bool result = false;
                            result = await BlocProvider.of<LoginCubit>(context)
                                .forgetPassword(
                              answer: _answer.text,
                              newPassword: _newPassword.text,
                              phoneNumber: _phoneNumber.text,
                              quesiton: secretQuestions[currIndex],
                            );
                            if (result) {
                              showSnackBar(context,
                                  "New password has been set. Login with new credential");
                              GoRouter.of(context).go('/login');
                            }
                          }
                        },
                        child: const Text("Change password"),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

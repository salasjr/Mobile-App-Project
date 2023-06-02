import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trad_doctors_new/application/bloc/auth/signup/signup_cubit.dart';
import 'package:trad_doctors_new/infrustructure/provider/auth_data_provider.dart';
import 'package:trad_doctors_new/presentation/constants/global_variables.dart';
import 'package:trad_doctors_new/presentation/constants/utils.dart';
import 'package:trad_doctors_new/presentation/pages/auth/widgets/custom_forms.dart';


class PatientAuthScreen extends StatefulWidget {
  const PatientAuthScreen({Key? key}) : super(key: key);

  @override
  State<PatientAuthScreen> createState() => _PatientAuthScreen();
}

class _PatientAuthScreen extends State<PatientAuthScreen> {
  int _pageState = 1;
  late File profilePicture;
  bool profilePicked = false;
  int secretQuestionPointer = 0;
  List<String> secretQuestions = [
    "What is your mother's name?",
    "What is your father's name?",
    "What is your nick name?",
    "What is your city?",
  ];
  late String currQuestion = secretQuestions[secretQuestionPointer];
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _secondPageGlobalKey = GlobalKey<FormState>();
  final TextEditingController _answerController = TextEditingController();
  final AuthDataProvider _authDataProvider = AuthDataProvider();

  @override
  void initState() {
    super.initState();
  }

  void pageStateIncrement() {
    setState(() {
      _pageState += 1;
    });
  }

  void pageStateDecrement() {
    setState(() {
      _pageState -= 1;
    });
  }

  void changeSecretQuestion() {
    setState(() {
      secretQuestionPointer += 1;
      secretQuestionPointer %= secretQuestions.length;

      currQuestion = secretQuestions[secretQuestionPointer];
    });
  }

  void imagePicked() {
    setState(() {
      profilePicked = true;
    });
  }

  Future<bool> validatePhone(phoneNumber) async {
    bool valid =
        await _authDataProvider.phoneValidate(phoneNumber: phoneNumber);
    return valid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
        centerTitle: true,
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<SignupCubit, SignupState>(listener: (context, state) {
            if (state.status == SignupStatus.success) {
              GoRouter.of(context).go('/login');
            }
          }),
        ],
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // page state one
                    if (_pageState == 1)
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: _signInFormKey,
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
                              FullNameInputSignUp(
                                  controller: _fullnameController),
                              const SizedBox(height: 10),
                              PhoneNumberInputSignup(
                                  controller: _phoneNumberController),
                              const SizedBox(height: 10),
                              PasswordInputSignup(
                                  controller: _passwordController),
                              const SizedBox(height: 10),
                              // confirm
                              const SizedBox(height: 30),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    GoRouter.of(context).push('/login');
                                  },
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
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 136),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      GoRouter.of(context).go('/');
                                    },
                                    child: const Text(
                                      "Back",
                                      style: TextStyle(
                                          color: GlobalVariables.primaryColor),
                                    ),
                                  ),
                                  const Text(
                                    "1/2",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 166, 166, 166),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      if (_signInFormKey.currentState!
                                          .validate()) {
                                        bool valid = await validatePhone(
                                            _phoneNumberController.text);
                                        if (valid) {
                                          pageStateIncrement();
                                        } else {
                                          // ignore: use_build_context_synchronously
                                          showSnackBar(context,
                                              "Phone number already exists");
                                        }
                                      }
                                    },
                                    child: const Text(
                                      "Next",
                                      style: TextStyle(
                                          color: GlobalVariables.primaryColor),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                    // Page state two

                    // Page state three
                    if (_pageState == 2)
                      Container(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            const Text(
                              "Almost there!",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 46, 46, 46)),
                            ),
                            const SizedBox(height: 25),
                            const Text(
                              "This is personal question in case you forgot your password, keep it safe.",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 33, 33, 33)),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 40),
                            Form(
                              key: _secondPageGlobalKey,
                              child: QuestionInputSignUp(
                                controller: _answerController,
                                currQuestion: currQuestion,
                                chagneQuestion: changeSecretQuestion,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ProfilePicInput(imagePicked: imagePicked),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  onPressed: pageStateDecrement,
                                  child: const Text(
                                    "Previous",
                                    style: TextStyle(
                                        color: GlobalVariables.primaryColor),
                                  ),
                                ),
                                const Text(
                                  "2/2",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 166, 166, 166),
                                      fontWeight: FontWeight.w500),
                                ),
                                SignupButton(
                                  role: 'patient',
                                  controller: _answerController,
                                  imagePicked: profilePicked,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

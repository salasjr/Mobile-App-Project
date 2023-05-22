import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:trad_doctors/common/custom_passwordfield.dart';
import 'package:trad_doctors/common/custom_phonenumber_field.dart';
import 'package:trad_doctors/features/auth/services/auth_service.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_textfield.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';

class ClientAuthScreen extends StatefulWidget {
  final String auth;
  const ClientAuthScreen({
    required this.auth,
    Key? key,
  }) : super(key: key);

  @override
  State<ClientAuthScreen> createState() => _ClientAuthScreenState();
}

class _ClientAuthScreenState extends State<ClientAuthScreen> {
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _signUpFormKey = GlobalKey<FormState>();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _addressControler = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _secretQuestionController =
      TextEditingController();
  final _secretQuestionKey = GlobalKey<FormState>();
  AuthService authService = AuthService();
  List<File> profilePicture = [];

  int secretQuestionPointer = 0;
  List<String> secretQuestions = [
    "What is your mother's name?",
    "What is your father's name?",
    "What is nick name?",
    "What is your city?",
  ];
  late String currQuestion = secretQuestions[secretQuestionPointer];
  late String _auth;
  int _pageState = 1;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _fullnameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _secretQuestionController.dispose();
    _addressControler.dispose();
  }

  @override
  void initState() {
    super.initState();
    _auth = widget.auth;
  }

  void swich() {
    if (_auth == "Sign up") {
      setState(() {
        _auth = "Sign in";
      });
    } else {
      setState(() {
        _auth = "Sign up";
      });
    }
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
      if (secretQuestionPointer == 4) {
        secretQuestionPointer = 0;
      }
      currQuestion = secretQuestions[secretQuestionPointer];
    });
  }

  void signUpInputValidate() {
    setState(() {
      _isLoading = true;
    });
    authService.signUpInputValidate(
      context: context,
      phoneNumber: _phoneNumberController.text,
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
      pageStateIncrement: () => pageStateIncrement(),
    );
    setState(() {
      _isLoading = false;
    });
  }

  void signUp(String role) {
    setState(() {
      _isLoading = true;
    });

    authService.signUpUser(
      context: context,
      fullName: _fullnameController.text,
      phoneNumber: _phoneNumberController.text,
      password: _passwordController.text,
      profilePicture: profilePicture[0],
      businessName: '',
      businessId: '',
      address: _addressControler.text,
      question: currQuestion,
      answer: _secretQuestionController.text,
      role: role,
    );
    setState(() {
      _isLoading = false;
    });
  }

  void signIn() {
    setState(() {
      _isLoading = true;
    });
    authService.signInUser(
      context: context,
      phoneNumber: _phoneNumberController.text,
      password: _passwordController.text,
    );
    setState(() {
      _isLoading = false;
    });
  }

  void selectImage() async {
    var res = await pickImage();
    setState(() {
      profilePicture = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _auth,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (_isLoading) const LinearProgressIndicator(),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_auth == "Sign up")
                    // Page state one
                    if (_pageState == 1)
                      Container(
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
                                  controller: _fullnameController,
                                  hintText: "Fullname"),
                              const SizedBox(height: 10),
                              CustomPhoneNumberField(
                                  controller: _phoneNumberController),
                              const SizedBox(height: 10),
                              CustomPasswordField(
                                  controller: _passwordController,
                                  labelText: 'password',
                                  validation: 'Enter your password'),
                              const SizedBox(height: 10),
                              CustomPasswordField(
                                  controller: _confirmPasswordController,
                                  labelText: 'Confirm password',
                                  validation: 'Confirm password'),
                              const SizedBox(height: 30),
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
                              const SizedBox(height: 140),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Previous",
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
                                    onPressed: () {
                                      if (_signUpFormKey.currentState!
                                          .validate()) {
                                        signUpInputValidate;
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

                  // AuthPageone(
                  //   swich: swich,
                  //   pageStateIncrement: pageStateIncrement,
                  //   pageNumber: 1,
                  //   maxPage: 2,
                  // ),

                  // page state two
                  if (_pageState == 2)
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
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
                                color: Color.fromARGB(255, 120, 120, 120)),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 25),
                          Text(
                            currQuestion,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 15),
                          Form(
                            key: _secretQuestionKey,
                            child: CustomTextField(
                              controller: _secretQuestionController,
                              hintText: "Your response",
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextButton(
                            onPressed: changeSecretQuestion,
                            child: const Text(
                              "Change another question.",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          CustomTextField(
                              controller: _addressControler,
                              hintText: "Address - example: Region, City"),
                          const SizedBox(
                            height: 10,
                          ),
                          profilePicture.isNotEmpty
                              ? SizedBox(
                                  height: 154,
                                  width: double.infinity,
                                  child: Image.file(profilePicture[0]))
                              : GestureDetector(
                                  onTap: selectImage,
                                  child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    radius: const Radius.circular(10),
                                    dashPattern: const [10, 4],
                                    strokeCap: StrokeCap.round,
                                    child: Container(
                                      width: double.infinity,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.folder_open,
                                            size: 40,
                                          ),
                                          SizedBox(height: 15),
                                          Text(
                                            "Select profile picture",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                          const SizedBox(height: 60),
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
                              TextButton(
                                onPressed: () {
                                  signUp('patient');
                                },
                                child: const Text(
                                  "Finish",
                                  style: TextStyle(
                                      color: GlobalVariables.primaryColor),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                  // AuthPageThree(
                  //   pageStateDecrement: pageStateDecrement,
                  //   pageNumber: 2,
                  //   maxPage: 2,
                  // ),
                  if (_auth == "Sign in")
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
                                "Welcome again, Sign in",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 66, 66, 66),
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            CustomPhoneNumberField(
                                controller: _phoneNumberController),
                            const SizedBox(height: 10),
                            CustomPasswordField(
                                controller: _passwordController,
                                labelText: 'password',
                                validation: 'Enter your password'),
                            const SizedBox(height: 15),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forget passowrd",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 190, 30, 19)),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: GestureDetector(
                                onTap: swich,
                                child: const Text.rich(
                                  TextSpan(
                                    text: "Don't you have an account? ",
                                    style: TextStyle(fontSize: 15),
                                    children: [
                                      TextSpan(
                                        text: "Sign up",
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
                            const SizedBox(height: 150),
                            CustomButton(
                              text: "Sign in",
                              onTap: () {
                                if (_signInFormKey.currentState!.validate()) {
                                  signIn();
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

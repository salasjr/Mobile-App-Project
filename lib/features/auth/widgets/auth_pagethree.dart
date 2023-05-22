import 'package:flutter/material.dart';

import '../../../common/custom_textfield.dart';
import '../../../constants/global_variables.dart';

class AuthPageThree extends StatefulWidget {
  final int pageNumber;
  final int maxPage;
  final VoidCallback pageStateDecrement;
  const AuthPageThree({
    Key? key,
    required this.pageStateDecrement,
    required this.pageNumber,
    required this.maxPage,
  }) : super(key: key);

  @override
  State<AuthPageThree> createState() => _AuthPageThreeState();
}

class _AuthPageThreeState extends State<AuthPageThree> {
  final TextEditingController _secretQuestionController =
      TextEditingController();
  final _secretQuestionKey = GlobalKey<FormState>();

  int secretQuestionPointer = 0;
  List<String> secretQuestions = [
    "What is your mother's name?",
    "What is your father's name?",
    "What is nick name?",
    "What is your city?",
  ];
  late String currQuestion = secretQuestions[secretQuestionPointer];
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
    _secretQuestionController.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
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
                color: Color.fromARGB(255, 33, 33, 33)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
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
          const SizedBox(height: 15),
          TextButton(
            onPressed: changeSecretQuestion,
            child: const Text(
              "Change another question.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 275),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: widget.pageStateDecrement,
                child: const Text(
                  "Previous",
                  style: TextStyle(color: GlobalVariables.primaryColor),
                ),
              ),
              Text(
                "$pageNumber/$maxPage",
                style: const TextStyle(
                    color: Color.fromARGB(255, 166, 166, 166),
                    fontWeight: FontWeight.w500),
              ),
              TextButton(
                onPressed: () {
                  if (_secretQuestionKey.currentState!.validate()) {
                    () {};
                  }
                },
                child: const Text(
                  "Finish",
                  style: TextStyle(color: GlobalVariables.primaryColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

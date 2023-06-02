import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';
import 'package:trad_doctors_new/application/bloc/auth/signup/signup_cubit.dart';
import 'package:trad_doctors_new/presentation/constants/global_variables.dart';
import 'package:trad_doctors_new/presentation/constants/utils.dart';


class PhoneNumberInputSignup extends StatefulWidget {
  final TextEditingController controller;
  const PhoneNumberInputSignup({super.key, required this.controller});

  @override
  State<PhoneNumberInputSignup> createState() => _PhoneNumberInputSignupState();
}

class _PhoneNumberInputSignupState extends State<PhoneNumberInputSignup> {
  bool _isFocused = false;
  bool _isTouched = false;

  bool isValidPhoneNumber(String phoneNumber) {
    RegExp regex = RegExp(r'^\+2519\d{8}$');

    if (regex.hasMatch(phoneNumber)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) =>
          previous.phoneNumber != current.phoneNumber,
      builder: (context, state) {
        return Focus(
          onFocusChange: (hasFocus) {
            setState(() {
              _isFocused = hasFocus;
            });
          },
          child: TextFormField(
            autovalidateMode: _isTouched
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            validator: (val) {
              bool isValid =
                  isValidPhoneNumber('+251${widget.controller.text}');
              if (val == null || val.isEmpty) {
                return 'Enter a your phone number';
              } else if (!isValid) {
                return 'Invalid phone number';
              }
              return null;
            },
            controller: widget.controller,
            onChanged: (phoneNumber) {
              if (widget.controller.text.isNotEmpty) {
                setState(() {
                  _isTouched = true;
                });
              } else {
                setState(() {
                  _isTouched = false;
                });
              }
              context.read<SignupCubit>().phoneNumberChanged(phoneNumber);
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixText: '+251 ',
              labelText: 'Phone number',
              hintText: '9XXXXXXXX',
              prefixStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _isFocused
                      ? GlobalVariables.primaryColor
                      : const Color.fromARGB(255, 143, 143, 143),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _isFocused
                      ? GlobalVariables.primaryColor
                      : const Color.fromARGB(255, 143, 143, 143),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class PasswordInputSignup extends StatefulWidget {
  final TextEditingController controller;
  const PasswordInputSignup({super.key, required this.controller});

  @override
  State<PasswordInputSignup> createState() => _PasswordInputSignupState();
}

class _PasswordInputSignupState extends State<PasswordInputSignup> {
  bool _obscureText = true;
  bool _isFocused = false;
  bool _isTouched = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Focus(
          onFocusChange: (hasFocus) {
            setState(() {
              _isFocused = hasFocus;
            });
          },
          child: TextFormField(
            autovalidateMode: _isTouched
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Enter your password';
              } else if (widget.controller.text.length < 6) {
                return 'Password should be at least 6 characters';
              }
              return null;
            },
            controller: widget.controller,
            onChanged: (password) {
              if (widget.controller.text.isNotEmpty) {
                setState(() {
                  _isTouched = true;
                });
              } else {
                setState(() {
                  _isTouched = false;
                });
              }
              context.read<SignupCubit>().passwordChanged(password);
            },
            decoration: InputDecoration(
              labelText: 'password',
              border: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: _isFocused
                      ? GlobalVariables.primaryColor
                      : const Color.fromARGB(255, 143, 143, 143),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: _isFocused
                      ? GlobalVariables.primaryColor
                      : const Color.fromARGB(255, 143, 143, 143),
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
            obscureText: _obscureText,
          ),
        );
      },
    );
  }
}

//!!!!  profilePicture;

class QuestionInputSignUp extends StatefulWidget {
  final String currQuestion;
  final VoidCallback chagneQuestion;
  final TextEditingController controller;

  const QuestionInputSignUp(
      {super.key,
      required this.currQuestion,
      required this.chagneQuestion,
      required this.controller});

  @override
  State<QuestionInputSignUp> createState() => _QuestionInputSignUpState();
}

class _QuestionInputSignUpState extends State<QuestionInputSignUp> {
  @override
  Widget build(BuildContext context) {
    context.read<SignupCubit>().questionChanged(widget.currQuestion);
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.question != current.question,
      builder: (context, state) {
        return Column(
          children: [
            Text(
              widget.currQuestion,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            const SizedBox(
              height: 15,
            ),
            AnswerInputSignUp(
              controller: widget.controller,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: widget.chagneQuestion,
              child: const Text(
                "change another question?",
                style: TextStyle(color: GlobalVariables.primaryColor),
              ),
            ),
          ],
        );
      },
    );
  }
}

class AnswerInputSignUp extends StatelessWidget {
  final TextEditingController controller;
  const AnswerInputSignUp({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.answer != current.answer,
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Enter your answer';
            }
            return null;
          },
          onChanged: (answerValue) {
            context.read<SignupCubit>().answerChanged(answerValue);
          },
          decoration: const InputDecoration(
            labelText: 'answer',

            // hintText: hintText,
            border: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 143, 143, 143),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 143, 143, 143),
              ),
            ),
          ),
        );
      },
    );
  }
}

class FullNameInputSignUp extends StatefulWidget {
  final TextEditingController controller;
  const FullNameInputSignUp({super.key, required this.controller});

  @override
  State<FullNameInputSignUp> createState() => _FullNameInputSignUpState();
}

class _FullNameInputSignUpState extends State<FullNameInputSignUp> {
  bool _isFocused = false;
  bool _isTouched = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.fullName != current.fullName,
      builder: (context, state) {
        return Focus(
          onFocusChange: (hasFocus) {
            setState(() {
              _isFocused = hasFocus;
            });
          },
          child: TextFormField(
            autovalidateMode: _isTouched
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Enter your fullname';
              }
              return null;
            },
            controller: widget.controller,
            onChanged: (fullNameValue) {
              if (widget.controller.text.isNotEmpty) {
                setState(() {
                  _isTouched = true;
                });
              } else {
                setState(() {
                  _isTouched = false;
                });
              }
              context.read<SignupCubit>().fullNameChanged(fullNameValue);
            },
            decoration: InputDecoration(
              labelText: 'Fullname',

              // hintText: hintText,
              border: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: _isFocused
                      ? GlobalVariables.primaryColor
                      : const Color.fromARGB(255, 143, 143, 143),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: _isFocused
                      ? GlobalVariables.primaryColor
                      : const Color.fromARGB(255, 143, 143, 143),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class BusinessNameInputSignUp extends StatelessWidget {
  final TextEditingController controller;
  const BusinessNameInputSignUp({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) =>
          previous.businessName != current.businessName,
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Enter your business name';
            }
            return null;
          },
          onChanged: (businessNameValue) {
            context.read<SignupCubit>().businessNameChanged(businessNameValue);
          },
          decoration: const InputDecoration(
            labelText: 'Business name',

            // hintText: hintText,
            border: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 143, 143, 143),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 143, 143, 143),
              ),
            ),
          ),
        );
      },
    );
  }
}

class BusinessIdInputSignUp extends StatelessWidget {
  final TextEditingController controller;
  const BusinessIdInputSignUp({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) =>
          previous.businessId != current.businessId,
      builder: (context, state) {
        return TextFormField(
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Enter your business id';
            }
            return null;
          },
          controller: controller,
          onChanged: (businessIdValue) {
            context.read<SignupCubit>().businessIdChanged(businessIdValue);
          },
          decoration: const InputDecoration(
            labelText: 'Business Id',

            // hintText: hintText,
            border: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 143, 143, 143),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 143, 143, 143),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AddressInputSignUp extends StatelessWidget {
  final TextEditingController controller;
  const AddressInputSignUp({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.address != current.address,
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'Enter your address';
            }
            return null;
          },
          onChanged: (addressValue) {
            context.read<SignupCubit>().addressChanged(addressValue);
          },
          decoration: const InputDecoration(
            labelText: 'Address',
            hintText: 'Example: Region, City',

            // hintText: hintText,
            border: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 143, 143, 143),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 143, 143, 143),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RoleInputSignUp extends StatelessWidget {
  const RoleInputSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.role != current.role,
      builder: (context, state) {
        return TextField(
          onChanged: (roleValue) {
            context.read<SignupCubit>().roleChanged(roleValue);
          },
          decoration: const InputDecoration(labelText: 'role'),
        );
      },
    );
  }
}

class SignupButton extends StatelessWidget {
  final String role;
  final bool imagePicked;
  final TextEditingController controller;
  const SignupButton(
      {Key? key,
      required this.role,
      required this.controller,
      required this.imagePicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<SignupCubit>().roleChanged(role);
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == SignupStatus.submitting
            ? const CircularProgressIndicator()
            : TextButton(
                onPressed: () {
                  if (controller.text.isNotEmpty && imagePicked) {
                    context.read<SignupCubit>().signupFormSubmitted();
                    GoRouter.of(context).go('/login');
                    showSnackBar(context,
                        "Account created succesfully. Login with the same phone number and password.");
                  } else if (!imagePicked) {
                    showSnackBar(context, "Please select your profile picture");
                  } else {
                    showSnackBar(
                        context, "Your answer is required for password reset");
                  }
                },
                child: const Text(
                  "Finish",
                  style: TextStyle(color: GlobalVariables.primaryColor),
                ),
              );
      },
    );
  }
}

class ProfilePicInput extends StatefulWidget {
  final VoidCallback imagePicked;
  const ProfilePicInput({super.key, required this.imagePicked});

  @override
  State<ProfilePicInput> createState() => _ProfilePicInputState();
}

class _ProfilePicInputState extends State<ProfilePicInput> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) =>
          previous.profilePicture != current.profilePicture,
      builder: (context, state) {
        return Column(
          children: [
            state.profilePicture.path.isNotEmpty
                ? GestureDetector(
                    onTap: () async {
                      await pickImage().then((pickiedImage) {
                        context
                            .read<SignupCubit>()
                            .onProfileChange(pickiedImage);
                        widget.imagePicked();
                      });
                    },
                    child: SizedBox(
                        height: 153,
                        width: double.infinity,
                        child: Image.file(state.profilePicture)),
                  )
                : GestureDetector(
                    onTap: () async {
                      await pickImage().then((pickiedImage) {
                        context
                            .read<SignupCubit>()
                            .onProfileChange(pickiedImage);
                        widget.imagePicked();
                      });
                    },
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
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
          ],
        );
      },
    );
  }
}

class PhoneNumberInput extends StatefulWidget {
  final TextEditingController controller;
  const PhoneNumberInput({super.key, required this.controller});

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  bool _isFocused = false;
  bool _isTouched = false;

  bool isValidPhoneNumber(String phoneNumber) {
    RegExp regex = RegExp(r'^\+2519\d{8}$');

    if (regex.hasMatch(phoneNumber)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.phoneNumber != current.phoneNumber,
      builder: (context, state) {
        return Focus(
          onFocusChange: (hasFocus) {
            setState(() {
              _isFocused = hasFocus;
            });
          },
          child: TextFormField(
            autovalidateMode: _isTouched
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            validator: (val) {
              bool isValid =
                  isValidPhoneNumber('+251${widget.controller.text}');
              if (val == null || val.isEmpty) {
                return 'Enter a your phone number';
              } else if (!isValid) {
                return 'Invalid phone number';
              }
              return null;
            },
            controller: widget.controller,
            onChanged: (phoneNumber) {
              if (widget.controller.text.isNotEmpty) {
                setState(() {
                  _isTouched = true;
                });
              } else {
                setState(() {
                  _isTouched = false;
                });
              }
              context.read<LoginCubit>().phoneNumberChanged(phoneNumber);
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              prefixText: '+251 ',
              labelText: 'Phone number',
              hintText: '9XXXXXXXX',
              prefixStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _isFocused
                      ? GlobalVariables.primaryColor
                      : const Color.fromARGB(255, 143, 143, 143),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _isFocused
                      ? GlobalVariables.primaryColor
                      : const Color.fromARGB(255, 143, 143, 143),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  const PasswordInput({super.key, required this.controller});

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;
  bool _isFocused = false;
  bool _isTouched = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Focus(
          onFocusChange: (hasFocus) {
            setState(() {
              _isFocused = hasFocus;
            });
          },
          child: TextFormField(
            autovalidateMode: _isTouched
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            controller: widget.controller,
            onChanged: (password) {
              if (widget.controller.text.isNotEmpty) {
                setState(() {
                  _isTouched = true;
                });
              } else {
                setState(() {
                  _isTouched = false;
                });
              }
              context.read<LoginCubit>().passwordChanged(password);
            },
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Enter your password';
              } else if (widget.controller.text.length < 6) {
                return 'Password should be at least 6 characters';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: 'password',
              border: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: _isFocused
                      ? GlobalVariables.primaryColor
                      : const Color.fromARGB(255, 143, 143, 143),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: _isFocused
                      ? GlobalVariables.primaryColor
                      : const Color.fromARGB(255, 143, 143, 143),
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
            obscureText: _obscureText,
          ),
        );
      },
    );
  }
}

class LoginButton extends StatelessWidget {
  final TextEditingController phoneControler;
  final TextEditingController passControler;
  const LoginButton(
      {super.key, required this.phoneControler, required this.passControler});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == LoginStatus.submitting
            ? const CircularProgressIndicator()
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () async {
                  if (phoneControler.text.isNotEmpty &&
                      passControler.text.isNotEmpty) {
                    await BlocProvider.of<LoginCubit>(context)
                        .logInWithCredentials();
                  } else if (phoneControler.text.isEmpty) {
                    showSnackBar(context, "Input your phone number");
                  } else if (passControler.text.isEmpty) {
                    showSnackBar(context, "Input your password");
                  }
                },
                child: const Text('LOGIN'),
              );
      },
      listener: (context, state) {
        if (state.user.role == "doctor") {
          GoRouter.of(context).go('/doctor');
        } else if (state.user.role == "patient") {
          GoRouter.of(context).go('/patient');
        } else if (state.user.role == "admin") {
          GoRouter.of(context).go('/admin');
        }
      },
    );
  }
}

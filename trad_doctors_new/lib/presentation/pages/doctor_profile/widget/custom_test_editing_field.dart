import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';
import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';

class UserProfileTextField extends StatefulWidget {
  final String label;
  final String initialValue;
  final VoidCallback onSaved;

  const UserProfileTextField({
    Key? key,
    required this.label,
    required this.initialValue,
    required this.onSaved,
  }) : super(key: key);

  @override
  State<UserProfileTextField> createState() => _UserProfileTextFieldState();
}

class _UserProfileTextFieldState extends State<UserProfileTextField> {
  late TextEditingController _controller;
  late String label;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    label = widget.label;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.label),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: TextButton(
            onPressed: () {
              widget.onSaved();
              String attribute = '';
              if (label == "Full Name") {
                attribute = 'fullname';
              } else if (label == "Bussiness Name") {
                attribute = "businessName";
              } else if (label == "Address") {
                attribute = "address";
              } else if (label == "Contact") {
                attribute = "phoneNumber";
              }

              String token =
                  BlocProvider.of<LoginCubit>(context).state.user.token;

              BlocProvider.of<LoginCubit>(context)
                  .editProfile(attribute, _controller.text, token);
            },
            child: const Text('Save'),
          ),
        ),
      ],
    );
  }
}

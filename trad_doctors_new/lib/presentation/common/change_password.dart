import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';
import 'package:trad_doctors_new/presentation/common/custom_textfield.dart';
import 'package:trad_doctors_new/presentation/constants/utils.dart';

class ChangePassowrd extends StatefulWidget {
  const ChangePassowrd({super.key});

  @override
  State<ChangePassowrd> createState() => _ChangePassowrdState();
}

class _ChangePassowrdState extends State<ChangePassowrd> {
  final TextEditingController _oldPassword = TextEditingController();
  final TextEditingController _newPassword = TextEditingController();
  final _globalKey = GlobalKey<FormState>();

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
          title: const Text("Profile"),
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
                        height: 20,
                      ),
                      const Text(
                        "Change your password",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 61, 61, 61)),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Enter your current password",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                          controller: _oldPassword,
                          hintText: 'Current password'),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Enter your new password",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                          controller: _newPassword, hintText: 'New password'),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          bool result = false;
                          if (_globalKey.currentState!.validate()) {
                            result = await context
                                .read<LoginCubit>()
                                .changePassowrd(
                                    _oldPassword.text,
                                    _newPassword.text,
                                    state.user.token,
                                    state.user.id);
                          }
                          if (result) {
                            showSnackBar(
                                context, "Password changed succefully");
                            GoRouter.of(context).pop();
                          }
                        },
                        child: const Text("Save"),
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

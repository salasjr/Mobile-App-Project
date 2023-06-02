import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';
import 'package:trad_doctors_new/presentation/common/custom_button.dart';
import 'package:trad_doctors_new/presentation/common/custom_textfield.dart';

import 'package:trad_doctors_new/presentation/constants/global_variables.dart';
import 'package:trad_doctors_new/application/bloc/services_bloc/services_bloc_bloc.dart';
import 'package:trad_doctors_new/domain/service_dto.dart';


class AddServicepage extends StatefulWidget {
  static const String routname = "appointment-screen";
  const AddServicepage({super.key});

  @override
  State<AddServicepage> createState() => _AddServicepageState();
}

class _AddServicepageState extends State<AddServicepage> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final _addServiceKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.primaryColor,
        title: const Text("Add new service"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addServiceKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Column(children: [
              const Text(
                "Add new service",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 40, 40, 40)),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: _title,
                hintText: "Title",
                validation: "Enter title",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: _description,
                hintText: "Desscription",
                maxLines: 7,
                validation: "Enter description",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: _price,
                hintText: "Price",
                validation: "Enter price",
                keyBoard: true,
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: CustomButton(
                  color: GlobalVariables.primaryColor,
                  text: "Done",
                  onTap: () {
                    if (_addServiceKey.currentState!.validate()) {
                      BlocProvider.of<ServicesBloc>(context).add(
                        AddService(
                          token: BlocProvider.of<LoginCubit>(context)
                              .state
                              .user
                              .token,
                          service: Service(
                            doctor_id: BlocProvider.of<LoginCubit>(context)
                                .state
                                .user
                                .id,
                            title: _title.text,
                            description: _description.text,
                            price: double.parse(_price.text),
                          ),
                        ),
                      );
                      GoRouter.of(context).pop();
                    }
                  },
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

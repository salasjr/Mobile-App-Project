import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';
// import 'package:trad_doctors_new/application/bloc/auth/login/login_cubit.dart';
import 'package:trad_doctors_new/presentation/constants/global_variables.dart';
import 'package:trad_doctors_new/application/bloc/services_bloc/services_bloc_bloc.dart';
import 'dart:core';

import 'package:trad_doctors_new/domain/service_dto.dart';

class Services extends StatefulWidget {
  static const String routname = "Services-screen";
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  late TextEditingController titleController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();
  late TextEditingController priceController = TextEditingController();
  int selectedId = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.primaryColor,
        title: const Center(child: Text("service")),
      ),
      body: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          if (state is ServicesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ServicesLoaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.services.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = state.services[index];
                      TextEditingController titleController =
                          TextEditingController(text: item.title);
                      TextEditingController descriptionController =
                          TextEditingController(text: item.description);
                      TextEditingController priceController =
                          TextEditingController(text: item.price.toString());

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: index == selectedId
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 10, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            controller: titleController,
                                            decoration: const InputDecoration(
                                              label: Text("Title"),
                                              border: UnderlineInputBorder(),
                                              focusedBorder:
                                                  UnderlineInputBorder(),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: descriptionController,
                                            decoration: const InputDecoration(
                                              label: Text("Description"),
                                              border: UnderlineInputBorder(),
                                              focusedBorder:
                                                  UnderlineInputBorder(),
                                            ),
                                          ),
                                          TextFormField(
                                            controller: priceController,
                                            decoration: const InputDecoration(
                                              label: Text("Price"),
                                              border: UnderlineInputBorder(),
                                              focusedBorder:
                                                  UnderlineInputBorder(),
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
                                        String token =
                                            BlocProvider.of<LoginCubit>(context)
                                                .state
                                                .user
                                                .token;
                                        BlocProvider.of<ServicesBloc>(context)
                                            .add(UpdateServices(
                                                index: index,
                                                service: Service(
                                                    description:
                                                        descriptionController
                                                            .text,
                                                    price: double.parse(
                                                        priceController.text),
                                                    title: titleController.text,
                                                    id: item.id,
                                                    doctor_id: item.doctor_id),
                                                token: token));
                                        setState(() {
                                          selectedId = -1;
                                        });
                                      },
                                      child: const Text('Save'),
                                    ),
                                  ),
                                ],
                              )
                            : Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Column(children: [
                                    ListTile(
                                      title: Text(
                                        "Title - ${item.title}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(
                                                255, 53, 53, 53)),
                                      ),
                                      subtitle: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.description,
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 10, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child:
                                                Text('Price: \$${item.price}'),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(Icons.edit),
                                                color: const Color.fromARGB(
                                                    255, 4, 64, 114),
                                                onPressed: () {
                                                  setState(() {
                                                    selectedId = index;
                                                  });
                                                },
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.delete),
                                                color: const Color.fromARGB(
                                                    255, 149, 10, 0),
                                                onPressed: () {
                                                  String token = BlocProvider
                                                          .of<LoginCubit>(
                                                              context)
                                                      .state
                                                      .user
                                                      .token;

                                                  BlocProvider.of<ServicesBloc>(
                                                          context)
                                                      .add(
                                                    DeleteServices(
                                                        token: token,
                                                        id: item.id,
                                                        index: index),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ]),
                                ),
                              ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: FloatingActionButton(
                    backgroundColor: GlobalVariables.primaryColor,
                    elevation: 0,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      GoRouter.of(context).push('/doctor/addservice');
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: Text("Error While fetching Services"));
          }
        },
      ),
    );
  }
}

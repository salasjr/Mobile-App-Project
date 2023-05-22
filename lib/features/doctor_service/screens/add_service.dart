import 'package:flutter/material.dart';
import 'package:trad_doctors/common/custom_textfield.dart';
import '../../../common/custom_button.dart';

class AddServicepage extends StatefulWidget {
  static const String routname = "appointment-screen";
  const AddServicepage({super.key});

  @override
  State<AddServicepage> createState() => _AddServicepageState();
}

class _AddServicepageState extends State<AddServicepage> {
  final TextEditingController _Title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final _addServiceKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                controller: _Title,
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
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: CustomButton(
                    text: "Done",
                    onTap: () {
                      if (_addServiceKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    }),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ServiceEditingTextField extends StatefulWidget {
  final double priceinitialValue;
  final String titleinitialValue;
  final String descriptioninitialValue;
  final VoidCallback onSaved;

  const ServiceEditingTextField({
    Key? key,
    required this.onSaved,
    required this.priceinitialValue,
    required this.titleinitialValue,
    required this.descriptioninitialValue,
  }) : super(key: key);

  @override
  State<ServiceEditingTextField> createState() =>
      _ServiceEditingTextFieldState();
}

class _ServiceEditingTextFieldState extends State<ServiceEditingTextField> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.titleinitialValue);
    _descriptionController =
        TextEditingController(text: widget.descriptioninitialValue);
    _priceController =
        TextEditingController(text: widget.priceinitialValue.toString());
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
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    label: Text("Title"),
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(),
                  ),
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    label: Text("Description"),
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(),
                  ),
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                    label: Text("Price"),
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
            },
            child: const Text('Save'),
          ),
        ),
      ],
    );
  }
}

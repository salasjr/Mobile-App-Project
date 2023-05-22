import 'package:flutter/material.dart';

class UserProfileTextField extends StatefulWidget {
  final String label;
  final String initialValue;
  final void Function(String)? onSaved;

  const UserProfileTextField({
    Key? key,
    required this.label,
    required this.initialValue,
    this.onSaved,
  }) : super(key: key);

  @override
  State<UserProfileTextField> createState() => _UserProfileTextFieldState();
}

class _UserProfileTextFieldState extends State<UserProfileTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
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
              widget.onSaved?.call(_controller.text);
            },
            child: const Text('Save'),
          ),
        ),
      ],
    );
  }
}

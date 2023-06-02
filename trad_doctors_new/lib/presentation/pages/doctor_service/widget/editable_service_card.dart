import 'package:flutter/material.dart';

class EditableServiceCard extends StatefulWidget {
  final String title;
  final String description;
  final double price;
  final VoidCallback togleEdit;
  const EditableServiceCard(
      {super.key,
      required this.title,
      required this.description,
      required this.price,
      required this.togleEdit});

  @override
  State<EditableServiceCard> createState() => _EditableServiceCardState();
}

class _EditableServiceCardState extends State<EditableServiceCard> {
  late String title;
  late String description;
  late double price;

  @override
  void initState() {
    super.initState();
    title = widget.title;
    description = widget.description;
    price = widget.price;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(children: [
          ListTile(
            title: Text(
              "Title - $title",
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 53, 53, 53)),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(description),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Price: \$$price'),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      color: const Color.fromARGB(255, 4, 64, 114),
                      onPressed: () {
                        setState(() {});
                        widget.togleEdit();
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      color: const Color.fromARGB(255, 149, 10, 0),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

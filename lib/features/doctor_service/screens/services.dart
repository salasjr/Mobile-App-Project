import 'package:flutter/material.dart';
import 'package:trad_doctors/constants/global_variables.dart';

import 'add_service.dart';

class Item {
  final String title;
  final String description;
  final double price;

  Item(this.title, this.description, this.price);
}

class Services extends StatefulWidget {
  static const String routname = "Services-screen";
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final List<Item> items = [
    Item(
        'Yetrs hkmna',
        'Description about the desease and the service provided by the doctor ',
        10.0),
    Item(
        'mestfakr',
        'Description about the desease and the service provided by the doctor',
        20.0),
    Item(
        'wegesha',
        'Description about the desease and the service provided by the doctor',
        30.0),
    Item(
        'kurtmat',
        'Description about the desease and the service provided by the doctor',
        40.0),
    Item(
        'snfete wesib1',
        'Description about the desease and the service provided by the doctor',
        50.0),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalVariables.primaryColor,
        title: const Center(child: Text("service")),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ],
                    ),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(children: [
                          ListTile(
                            title: Text(
                              "Title - ${item.title}",
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
                                  Text(item.description),
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
                                  child: Text(
                                      'Price: \$${item.price.toStringAsFixed(2)}'),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      color:
                                          const Color.fromARGB(255, 4, 64, 114),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      color:
                                          const Color.fromARGB(255, 149, 10, 0),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddServicepage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
